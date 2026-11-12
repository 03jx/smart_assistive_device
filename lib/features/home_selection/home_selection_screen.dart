import 'package:flutter/material.dart';
import 'package:smart_assistive_device/features/blind_ui/blind_home_screen.dart';
import 'package:smart_assistive_device/features/caretaker_ui/caretaker_login_screen.dart';
import 'package:smart_assistive_device/features/developer_ui/developer_login_screen.dart';

class HomeSelectionScreen extends StatefulWidget {
const HomeSelectionScreen({super.key});

@override
State<HomeSelectionScreen> createState() => _HomeSelectionScreenState();
}

class _HomeSelectionScreenState extends State<HomeSelectionScreen> {
final int batteryLevel = 85;
final bool isConnected = true;

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[900],
appBar: AppBar(
backgroundColor: Colors.blueGrey[900],
title: const Text(
'المساعد الذكي - اختيار الواجهة',
style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(15.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
// بطاقة الحالة
Card(
color: Colors.grey[850],
elevation: 4,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
child: Padding(
padding: const EdgeInsets.all(12.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Row(
children: [
Icon(
isConnected ? Icons.check_circle : Icons.error,
color: isConnected ? Colors.green : Colors.red,
size: 20,
),
const SizedBox(width: 6),
const Text(
'الجهاز متصل',
style: TextStyle(color: Colors.white, fontSize: 14),
),
],
),
Row(
children: [
const Icon(Icons.battery_charging_full, color: Colors.green, size: 20),
const SizedBox(width: 6),
Text(
'البطارية: $batteryLevel%',
style: const TextStyle(
color: Colors.white,
fontSize: 14,
fontWeight: FontWeight.bold,
),
),
],
),
],
),
),
),

        const SizedBox(height: 10),

        const Text(
          'اختر الواجهة المطلوبة:',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),

        const SizedBox(height: 10),

        // 1. زر واجهة الكفيف
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BlindHomeScreen()),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.visibility_off, size: 40, color: Colors.black),
                SizedBox(height: 6),
                Text(
                  'واجهة الكفيف',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // 2. زر واجهة ولي الأمر
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CaretakerLoginScreen()),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.security, size: 40, color: Colors.white),
                SizedBox(height: 6),
                Text(
                  'واجهة ولي الأمر',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // 3. زر واجهة المطور
        SizedBox(
          height: 55,child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeveloperLoginScreen()),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.code, size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'واجهة المطور (Developer Login)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
}
}