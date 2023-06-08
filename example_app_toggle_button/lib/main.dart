import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const ToggleButtonApp());
}

class ToggleButtonApp extends StatelessWidget {
  const ToggleButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle Button App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
