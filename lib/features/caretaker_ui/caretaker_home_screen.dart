import 'package:flutter/material.dart';

class CaretakerHomeScreen extends StatefulWidget {
const CaretakerHomeScreen({super.key});

@override
State<CaretakerHomeScreen> createState() => _CaretakerHomeScreenState();
}

class _CaretakerHomeScreenState extends State<CaretakerHomeScreen> {
// متغير وضع عدم الإزعاج
bool isDoNotDisturbActive = false;

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[100],
appBar: AppBar(
backgroundColor: Colors.teal[800],
title: const Text(
'لوحة تحكم ولي الأمر',
style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
// مفتاح وضع عدم الإزعاج (Do Not Disturb)
Card(
elevation: 2,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
child: SwitchListTile(
title: const Text(
'وضع عدم الإزعاج (Do Not Disturb)',
style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
),
subtitle: const Text('كتم التنبيهات غير الطارئة مؤقتاً'),
secondary: const Icon(Icons.do_not_disturb_on, color: Colors.orange),
value: isDoNotDisturbActive,
onChanged: (bool value) {
setState(() {
isDoNotDisturbActive = value;
});
},
),
),

        const SizedBox(height: 20),

        const Text(
          'سجل تنبيهات الطوارئ والإشعارات:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        
        const SizedBox(height: 10),

        // قائمة سجل التنبيهات الواردة
        Expanded(
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.sos, color: Colors.red, size: 35),
                title: Text('تم استلام نداء استغاثة (SOS)'),
                subtitle: Text('اليوم - 02:15 م (تم إرسال الموقع)'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.notifications_active, color: Colors.amber),
                title: Text('تم تشغيل مستشعر التعرف على العوائق'),
                subtitle: Text('اليوم - 01:50 م'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.blue),
                title: Text('تم تحديث الموقع الجغرافي (GPS)'),
                subtitle: Text('اليوم - 12:30 م'),
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