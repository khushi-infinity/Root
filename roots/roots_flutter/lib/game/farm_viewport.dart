import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scene/scene.dart';
import 'package:vector_math/vector_math.dart' as vm;

import '../world/camera_rig.dart';
import '../world/game_world.dart';

/// The live 3D farm. Owns the flutter_scene [Scene] and drives per-frame
/// updates through the SceneView tick.
class FarmViewport extends StatefulWidget {
  const FarmViewport({
    super.key,
    required this.world,
    this.onReady,
    this.onTapResult,
  });

  final GameWorld world;
  final VoidCallback? onReady;
  final void Function(bool hit, String nodeDebug)? onTapResult;

  @override
  State<FarmViewport> createState() => _FarmViewportState();
}

class _FarmViewportState extends State<FarmViewport> {
  late final CameraRig _rig;
  late final Camera _camera;
  bool _ready = false;
  Size _viewSize = const Size(1, 1);

  @override
  void initState() {
    super.initState();
    _rig = CameraRig();
    _camera = _rig.camera;
    widget.world.loadInto(widget.world.scene).then((_) {
      if (mounted) {
        setState(() => _ready = true);
        widget.onReady?.call();
      }
    });
  }

  void _handleTapUp(TapUpDetails details) {
    if (!_ready) return;

    final ray = _camera.screenPointToRay(details.localPosition, _viewSize);
    final hit = widget.world.scene.raycast(ray);

    if (hit != null) {
      // Check if we hit a crop
      if (hit.node.name.startsWith('wheat') || hit.node.name.contains('crop')) {
        _onCropHit(hit);
      }
      // Check if we hit a field plot
      else if (hit.node.name == 'fieldPlot') {
        _onFieldPlotHit(hit);
      }
      // Hit terrain - check if it's a valid planting area
      else if (hit.node.name == 'terrain') {
        _onTerrainHit(hit, ray);
      }
      else {
        widget.onTapResult?.call(true, hit.node.name);
      }
    } else {
      widget.onTapResult?.call(false, '');
    }
  }

  void _onCropHit(SceneRaycastHit hit) {
    debugPrint('Crop tapped: ${hit.node.name}');
    widget.onTapResult?.call(true, hit.node.name);
  }

  void _onFieldPlotHit(SceneRaycastHit hit) {
    // Plant wheat at this position
    final pos = hit.node.position;
    widget.world.cropManager.plantWheat(pos);
    debugPrint('Planted wheat at: $pos');
    widget.onTapResult?.call(true, hit.node.name);
  }

  void _onTerrainHit(SceneRaycastHit hit, ray) {
    // Check if the tap is on valid planting soil
    final worldPos = hit.worldPoint;
    if (worldPos != null) {
      final x = worldPos.x;
      final z = worldPos.z;
      // Check if it's a valid placement area (field area)
      if (x.abs() < 20 && z.abs() < 20) {
        // Plant wheat
        widget.world.cropManager.plantWheat(worldPos);
        debugPrint('Planted wheat at terrain position: $worldPos');
      }
    }
    widget.onTapResult?.call(true, '');
  }

  @override
  void dispose() {
    widget.world.scene.remove(_rig.cameraNode);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return Container(
        color: const Color(0xFF10140D),
        alignment: Alignment.center,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Color(0xFF9AB86B)),
            SizedBox(height: 16),
            Text(
              'GROWING THE WORLD…',
              style: TextStyle(
                color: Color(0xFF9AB86B),
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        _viewSize = Size(constraints.maxWidth, constraints.maxHeight);
        _rig.setViewSize(_viewSize);
        // Listen to keyboard so WASD pans the camera. The Focus node keeps
        // key events alive while the game is visible.
        return Focus(
          autofocus: true,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent) {
              _rig.keyDown(event.logicalKey.keyLabel);
            } else if (event is KeyUpEvent) {
              _rig.keyUp(event.logicalKey.keyLabel);
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapUp: _handleTapUp,
            child: CameraControls(
              controller: _rig.orbit,
              child: SceneView(
                widget.world.scene,
                camera: _camera,
                onTick: (elapsed, dt) => widget.world.update(dt),
              ),
            ),
          ),
        );
      },
    );
  }
}