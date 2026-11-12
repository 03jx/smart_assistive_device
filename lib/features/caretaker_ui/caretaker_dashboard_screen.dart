import 'package:flutter/material.dart';

class CaretakerDashboardScreen extends StatelessWidget {
  const CaretakerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: const Text('لوحة تحكم ولي الأمر', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'مرحباً بكِ في لوحة تحكم ولي الأمر\n(جارِ ربط بيانات الجهاز والحساسات)',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}