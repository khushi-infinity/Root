import 'package:flutter/material.dart';

import 'game_screen.dart';

/// Cinematic entry: ROOTS / Build. Grow. Together.
class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _breath;

  @override
  void initState() {
    super.initState();
    _breath = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _breath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _breath,
        builder: (context, child) => DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color(0xFF16211A),
                Color(0xFF0E130C),
              ],
              stops: [
                0.55 - 0.05 * _breath.value,
                1.0,
              ],
            ),
          ),
          child: child,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(flex: 3),
              // Sun-disk mark.
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFD9A441).withValues(alpha: 0.9),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD9A441).withValues(alpha: 0.35),
                      blurRadius: 60,
                      spreadRadius: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 42),
              Text(
                'ROOTS',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: const Color(0xFFEDE6D6),
                      letterSpacing: 20,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(height: 14),
              Text(
                'Build. Grow. Together.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF9AB86B).withValues(alpha: 0.85),
                      letterSpacing: 3,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const Spacer(flex: 2),
              _EnterWorldButton(onEnter: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 900),
                    pageBuilder: (_, _, _) => const GameScreen(),
                    transitionsBuilder: (_, animation, _, child) =>
                        FadeTransition(
                      opacity: CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                      child: child,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 26),
              Text(
                'A shared world powered by Serverpod',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFEDE6D6).withValues(alpha: 0.45),
                      letterSpacing: 1.2,
                    ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _EnterWorldButton extends StatefulWidget {
  const _EnterWorldButton({required this.onEnter});

  final VoidCallback onEnter;

  @override
  State<_EnterWorldButton> createState() => _EnterWorldButtonState();
}

class _EnterWorldButtonState extends State<_EnterWorldButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 16),
        decoration: BoxDecoration(
          color: _hover
              ? const Color(0xFF9AB86B).withValues(alpha: 0.22)
              : const Color(0xFF9AB86B).withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: const Color(0xFF9AB86B).withValues(alpha: _hover ? 0.8 : 0.4),
            width: 1.2,
          ),
        ),
        child: GestureDetector(
          onTap: widget.onEnter,
          child: const Text(
            'ENTER WORLD',
            style: TextStyle(
              color: Color(0xFFEDE6D6),
              fontWeight: FontWeight.w600,
              letterSpacing: 4,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
