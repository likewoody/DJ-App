import 'package:flutter/material.dart';

class DiagnosisTestPage extends StatelessWidget {
  const DiagnosisTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '한달 동안 운동을 하신적이 있습니까?',
              style: TextStyle(
                fontSize: 20
              ),
              ),
          ],
        ),
      ),
    );
  }
}