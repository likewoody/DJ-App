import 'package:flutter/material.dart';

class SetEmail extends StatelessWidget {
  SetEmail({super.key});

  // Property
  final TextEditingController textCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이메일 설정'),
      ),
      body: Column(
        children: [
          const Text('이메일 주소'),
          TextField(
            controller: textCon,
            decoration: const InputDecoration(
              labelText: '이메일을 입력하세요'
            ),
          ),
          const Text(
            'SNS로 가입한 계정은 수정이 불가능해요!',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}