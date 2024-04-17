import 'package:flutter/material.dart';

class SetHeightWeight extends StatelessWidget {
  final height;
  final weight;
  const SetHeightWeight({super.key, required this.height, required this.weight});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('키/몸무게 설정'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(height),
            Text(weight),

            ElevatedButton(
              onPressed: () {}, 
              child: const Text('이메일 변경하기')
            ),
          ],
        ),
      ),
    );
  }
}