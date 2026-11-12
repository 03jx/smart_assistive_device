import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BlindHomeScreen extends StatefulWidget {
const BlindHomeScreen({super.key});

@override
State<BlindHomeScreen> createState() => _BlindHomeScreenState();
}

class _BlindHomeScreenState extends State<BlindHomeScreen> {
final FlutterTts flutterTts = FlutterTts();

// تفضيلات المستخدم (بناءً على مخطط قاعدة البيانات)
double speechSpeed = 0.5; // سرعة النطق
double audioVolume = 1.0; // مستوى الصوت

@override
void initState() {
super.initState();
_initTtsAndWelcome();
}

Future<void> _initTtsAndWelcome() async {
await flutterTts.setLanguage("ar-SA");
await flutterTts.setSpeechRate(speechSpeed);
await flutterTts.setVolume(audioVolume);
await flutterTts.speak("أهلاً بكِ في واجهة الكفيف. انقري على الأزرار لتفعيل الوظائف.");
}

Future<void> _speakText(String text) async {
await flutterTts.stop();
await flutterTts.setSpeechRate(speechSpeed);
await flutterTts.setVolume(audioVolume);
await flutterTts.speak(text);
}

@override
void dispose() {
flutterTts.stop();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.black,
appBar: AppBar(
backgroundColor: Colors.amber[800],
title: const Text(
'واجهة الكفيف الذكية',
style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
// الزر الرئيسي: التعرف على المحيط والعوائق (الكاميرا)
Expanded(
flex: 2,
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.amber[700],
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(25),
),
),
onPressed: () {
_speakText("جاري تشغيل الكاميرا لتحليل المحيط والتعرف على العوائق...");
},
child: const Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.visibility_off, size: 90, color: Colors.black),
SizedBox(height: 15),
Text(
'التعرّف على المحيط والعوائق',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
),
],
),
),
),

        const SizedBox(height: 20),

        // زر المساعدة الطارئة (SOS)
        Expanded(
          flex: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              _speakText("تم إرسال نداء الاستغاثة والموقع لولي الأمر بنجاح.");
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sos, size: 50, color: Colors.white),
                SizedBox(width: 15),
                Text(
                  'طلب المساعدة (SOS)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 20),

        // زر التحكم السريع في سرعة الصوت (تفضيلات المستخدم)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'سرعة القراءة الصوتية:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.speed, color: Colors.amber),
                onPressed: () {
                  setState(() {
                    speechSpeed = speechSpeed == 0.5 ? 0.8 : 0.5;
                  });
                  _speakText(speechSpeed == 0.5 ? "تم ضبط السرعة إلى العادية" : "تم زيادة سرعة القراءة");
                },
              ),
              ],
          ),
        ),
      ],
    ),
  ),
);
}
}