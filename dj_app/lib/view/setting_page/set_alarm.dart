import 'package:flutter/material.dart';

class SetAlarm extends StatelessWidget {
  SetAlarm({super.key});

  bool alarmSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알림 설정'),
      ),
      body: Center(
        child: Switch(
          value: alarmSwitch, 
          onChanged: (value) {
            alarmSwitch = value;
          },
        ),
      ),
    );
  }
}