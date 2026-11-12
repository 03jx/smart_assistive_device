import 'package:flutter/material.dart';

class DeveloperLoginScreen extends StatefulWidget {
const DeveloperLoginScreen({super.key});

@override
State<DeveloperLoginScreen> createState() => _DeveloperLoginScreenState();
}

class _DeveloperLoginScreenState extends State<DeveloperLoginScreen> {
final _keyController = TextEditingController();
final String correctKey = "dev123"; // رمز الوصول الافتراضي للمطور

void _verifyKey() {
if (_keyController.text == correctKey) {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const DeveloperDashboardScreen()),
);
} else {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('رمز الوصول غير صحيح، حاول مرة أخرى (الرمز: dev123)'),
backgroundColor: Colors.red,
),
);
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[900],
appBar: AppBar(
backgroundColor: Colors.indigo[900],
title: const Text('دخول المطور', style: TextStyle(color: Colors.white)),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(Icons.code, size: 80, color: Colors.indigoAccent),
const SizedBox(height: 20),
TextField(
controller: _keyController,
obscureText: true,
style: const TextStyle(color: Colors.white),
decoration: InputDecoration(
labelText: 'رمز الوصول للمطور (Developer Access Key)',
labelStyle: const TextStyle(color: Colors.white70),
prefixIcon: const Icon(Icons.key, color: Colors.indigoAccent),
enabledBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.indigoAccent),
borderRadius: BorderRadius.circular(10),
),
focusedBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.white),
borderRadius: BorderRadius.circular(10),
),
),
),
const SizedBox(height: 25),
SizedBox(
width: double.infinity,
height: 50,
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.indigo[700],
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
),
onPressed: _verifyKey,
child: const Text('التحقق والدخول', style: TextStyle(fontSize: 18, color: Colors.white)),
),
),
],
),
),
);
}
}

class DeveloperDashboardScreen extends StatelessWidget {
const DeveloperDashboardScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[900],
appBar: AppBar(
backgroundColor: Colors.indigo[900],
title: const Text('لوحة تحكم ومراقبة المطور', style: TextStyle(color: Colors.white)),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: ListView(
children: [
// بطاقة حالة الهاردوير
Card(
color: Colors.grey[850],
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
child: const Padding(
padding: EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('حالة متحكم ESP32-S3 والهاردوير', style: TextStyle(color: Colors.indigoAccent, fontSize: 16, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text('حالة الاتصال: متصل (Online)', style: TextStyle(color: Colors.white70)),
Text('البطارية: 85%', style: TextStyle(color: Colors.white70)),
],
),
SizedBox(height: 6),
Text('الكاميرا (OV2640): جاهزة البث', style: TextStyle(color: Colors.white70)),
Text('حساسات الـ GPS والمسافة: تعمل بكفاءة', style: TextStyle(color: Colors.white70)),
],
),
),
),
const SizedBox(height: 20),
const Text(
'سجلات النظام والأخطاء (System Logs & Debugging)',
style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
),
const SizedBox(height: 10),

        // صندوق عرض السجلات الوهمية
        Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.indigoAccent.withValues(alpha: 0.5)),
          ),
          child: const SingleChildScrollView(
            child: Text('[INFO] ESP32-S3 Initialized successfully.\n'
              '[INFO] Connected to local network.\n'
              '[DEBUG] Camera OV2640 stream frame rate: 30fps.\n'
              '[INFO] GPS coordinates updated: 32.8872, 13.1913.\n'
              '[DEBUG] Sensor telemetry data streaming normally.',
              style: TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontSize: 13),
            ),
          ),
        ),
      ],
    ),
  ),
);
}
}