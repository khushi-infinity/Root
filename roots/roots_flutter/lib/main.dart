import 'package:flutter/material.dart';

import 'screens/title_screen.dart';

void main() {
  runApp(const RootsApp());
}

class RootsApp extends StatelessWidget {
  const RootsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROOTS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3E5622),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF10140D),
        useMaterial3: true,
      ),
      home: const TitleScreen(),
    );
  }
}
