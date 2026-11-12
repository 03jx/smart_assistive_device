import 'package:flutter/material.dart';
import 'features/home_selection/home_selection_screen.dart';

void main() {
  runApp(const SmartAssistiveApp());
}

class SmartAssistiveApp extends StatelessWidget {
  const SmartAssistiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مساعد ذكي لذوي الإعاقة البصرية',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeSelectionScreen(),
    );
  }
}