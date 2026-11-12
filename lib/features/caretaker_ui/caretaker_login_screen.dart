import 'package:flutter/material.dart';

class CaretakerLoginScreen extends StatefulWidget {
const CaretakerLoginScreen({super.key});

@override
State<CaretakerLoginScreen> createState() => _CaretakerLoginScreenState();
}

class _CaretakerLoginScreenState extends State<CaretakerLoginScreen> {
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[900],
appBar: AppBar(
backgroundColor: Colors.teal[800],
title: const Text('تسجيل دخول ولي الأمر', style: TextStyle(color: Colors.white)),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(Icons.security, size: 80, color: Colors.teal),
const SizedBox(height: 20),
TextField(
controller: _emailController,
style: const TextStyle(color: Colors.white),
decoration: InputDecoration(
labelText: 'البريد الإلكتروني',
labelStyle: const TextStyle(color: Colors.white70),
prefixIcon: const Icon(Icons.email, color: Colors.teal),
enabledBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.teal),
borderRadius: BorderRadius.circular(10),
),
focusedBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.white),
borderRadius: BorderRadius.circular(10),
),
),
),
const SizedBox(height: 15),
TextField(
controller: _passwordController,
obscureText: true,
style: const TextStyle(color: Colors.white),
decoration: InputDecoration(
labelText: 'كلمة السر',
labelStyle: const TextStyle(color: Colors.white70),
prefixIcon: const Icon(Icons.lock, color: Colors.teal),
enabledBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.teal),
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
backgroundColor: Colors.teal[700],
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => const CaretakerDashboardScreen()),
);
},
child: const Text('دخول', style: TextStyle(fontSize: 18, color: Colors.white)),
),
),
],
),
),
);
}
}

class CaretakerDashboardScreen extends StatefulWidget {
const CaretakerDashboardScreen({super.key});

@override
State<CaretakerDashboardScreen> createState() => _CaretakerDashboardScreenState();
}

class _CaretakerDashboardScreenState extends State<CaretakerDashboardScreen> {
bool isDoNotDisturbActive = false;
bool isDeviceMuted = false;

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[900],
appBar: AppBar(
backgroundColor: Colors.teal[800],
title: const Text('لوحة تحكم ولي الأمر', style: TextStyle(color: Colors.white)),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: ListView(
children: [
// بطاقة حالة الجهاز الحية
Card(
color: Colors.grey[850],
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
child: const Padding(
padding: EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('حالة الجهاز الملبوس', style: TextStyle(color: Colors.tealAccent, fontSize: 16, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text('الاتصال: متصل', style: TextStyle(color: Colors.white70)),
Text('البطارية: 85%', style: TextStyle(color: Colors.white70)),
],
),
],
),
),
),
const SizedBox(height: 20),
const Text(
'إعدادات التحكم والتحويل',
style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
),
const SizedBox(height: 10),

        // زر مفتاح عدم الإزعاج
        SwitchListTile(
          title: const Text('وضع عدم الإزعاج (Do Not Disturb)', style: TextStyle(color: Colors.white)),subtitle: const Text('إيقاف التنبيهات الصوتية المؤقتة للجهاز', style: TextStyle(color: Colors.white54, fontSize: 12)),
          value: isDoNotDisturbActive,
          activeThumbColor: Colors.tealAccent,
          onChanged: (bool value) {
            setState(() {
              isDoNotDisturbActive = value;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(value ? 'تم تفعيل وضع عدم الإزعاج' : 'تم إلغاء وضع عدم الإزعاج')),
            );
          },
        ),
        
        // زر كتم الصوت
        SwitchListTile(
          title: const Text('كتم صوت الجهاز', style: TextStyle(color: Colors.white)),
          subtitle: const Text('كتم مخرجات الـ TTS والتنبيهات', style: TextStyle(color: Colors.white54, fontSize: 12)),
          value: isDeviceMuted,
          activeThumbColor: Colors.tealAccent,
          onChanged: (bool value) {
            setState(() {
              isDeviceMuted = value;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(value ? 'تم كتم صوت الجهاز' : 'تم إلغاء كتم الصوت')),
            );
          },
        ),
      ],
    ),
  ),
);
}
}