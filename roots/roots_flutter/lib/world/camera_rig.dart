import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_scene/scene.dart';
import 'package:vector_math/vector_math.dart' as vm;

/// Elevated third-person / farm-builder camera.
///
/// Uses flutter_scene's [OrbitCameraController] so the orbit math behaves
/// correctly in the engine's left-handed view space, and drives it from our
/// own gesture handlers (drag rotates, wheel zooms, WASD pans).
class CameraRig {
  final cameraNode = Node();
  final cameraComponent = CameraComponent(
    projection: PerspectiveProjection(fovRadiansY: 38 * math.pi / 180),
  );
  late final OrbitCameraController orbit;
  late final Camera camera;

  /// Fallback built-in camera input resize synchronisation.
  Size _viewSize = const Size(1, 1);

  final Set<String> _heldKeys = {};

  CameraRig() {
    camera = cameraComponent.toCamera();
    cameraNode.addComponent(cameraComponent);
    orbit = OrbitCameraController(
      target: vm.Vector3(0, 0.5, 4),
      distance: 26,
      azimuth: 0.6,
      polar: 0.55,
      minDistance: 4,
      maxDistance: 60,
      minPolar: 0.12,
      maxPolar: 1.15,
      rotateSpeed: 1.6,
      dollySpeed: 0.25,
      panSpeed: 1.0,
      smoothing: 0.16,
    );
    cameraNode.addComponent(orbit);
    cameraNode.name = 'cameraRig';
  }

  void setViewSize(Size size) {
    _viewSize = size;
    orbit.viewportSize = size;
  }

  // ---- Input ----

  void onDragUpdate(Offset delta) {
    final k = orbit.rotateSpeed / _viewSize.height;
    orbit.orbitBy(-delta.dx * k, -delta.dy * k);
  }

  void onScroll(double scrollDelta) => orbit.handleScroll(scrollDelta);

  void onScale(double scaleFactor) => orbit.dollyBy(scaleFactor - 1.0);

  void onSecondaryDrag(Offset delta) {
    orbit.panBy(Offset(delta.dx / _viewSize.height, delta.dy / _viewSize.height));
  }

  /// World-space pan from arrow keys, scaled by elapsed time.
  void _applyKeyboardPan(double dt) {
    if (_heldKeys.isEmpty) return;
    final forward = camera.horizontalForward;
    final right = camera.horizontalRight;
    final speed = 14.0;
    var shift = vm.Vector3.zero();
    if (_heldKeys.contains('w')) shift += forward * speed;
    if (_heldKeys.contains('s')) shift -= forward * speed;
    if (_heldKeys.contains('d')) shift += right * speed;
    if (_heldKeys.contains('a')) shift -= right * speed;
    if (shift.length == 0) {
      if (_heldKeys.contains('arrowUp')) shift += forward * speed;
      if (_heldKeys.contains('arrowDown')) shift -= forward * speed;
      if (_heldKeys.contains('arrowRight')) shift += right * speed;
      if (_heldKeys.contains('arrowLeft')) shift -= right * speed;
    }
    _panWorld(shift * dt);
  }

  /// Moves the orbit target along the ground plane, keeping it inside the
  /// farm bounds so the camera can never wander off the world.
  void _panWorld(vm.Vector3 shift) {
    final target = orbit.target + shift;
    orbit.target = vm.Vector3(
      target.x.clamp(-40.0, 40.0),
      0.0,
      target.z.clamp(-40.0, 40.0),
    );
  }

  // ---- Keyboard state ----

  void keyDown(String logicalKey) {
    final k = logicalKey.toLowerCase();
    const supported = {
      'w', 'a', 's', 'd', 'arrow up', 'arrow down', 'arrow left', 'arrow right',
    };
    if (supported.contains(k)) _heldKeys.add(k);
  }

  void keyUp(String logicalKey) {
    _heldKeys.remove(logicalKey.toLowerCase());
  }

  // ---- Per-frame ----

  void tick(double dt) {
    _applyKeyboardPan(dt);
  }
}
