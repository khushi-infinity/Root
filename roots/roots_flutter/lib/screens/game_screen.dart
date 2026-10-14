import 'package:flutter/material.dart';

import '../client.dart';
import '../game/farm_viewport.dart';
import '../world/game_world.dart';

/// Fullscreen farm with the minimal HUD.
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final world = GameWorld();
  bool _connected = false;
  String _status = 'CONNECTING';

  @override
  void initState() {
    super.initState();
    _probeServer();
  }

  Future<void> _probeServer() async {
    try {
      final greeting = await client.greeting
          .hello('roots')
          .timeout(const Duration(seconds: 4));
      _status = greeting.message.contains('Hello') ? 'LIVE' : 'OFFLINE';
    } catch (_) {
      _status = 'OFFLINE';
    }
    if (mounted) setState(() => _connected = _status == 'LIVE');
  }

  @override
  Widget build(BuildContext context) {
    // Show connection state while probing, then render the 3D farm.
    if (!_connected) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _status,
                style: const TextStyle(color: Color(0xFF9AB86B), fontSize: 18),
              ),
              const SizedBox(height: 24),
              const CircularProgressIndicator(color: Color(0xFF9AB86B)),
              const SizedBox(height: 12),
              const Text(
                'Connecting to the farm world...',
                style: TextStyle(
                  color: Color(0xFFEDE6D6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Connected - render the 3D FarmViewport.
    return Scaffold(
      body: FarmViewport(
        world: world,
        onReady: () {},
      ),
    );
  }
}
