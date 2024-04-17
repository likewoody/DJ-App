import 'package:flutter/material.dart';

class SetPassword extends StatelessWidget {
  SetPassword({super.key});

  final TextEditingController pwCon1 = TextEditingController();
  final TextEditingController pwCon2 = TextEditingController();
  final TextEditingController pwCon3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 설정'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('현재 비밀번호'),
            TextField(
              controller: pwCon1,
              decoration: const InputDecoration(
                labelText: '비밀번호를 입력해주세요'
              ),
            ),

            const Text('새로운 비밀번호'),
            TextField(
              controller: pwCon2,
              decoration: const InputDecoration(
                labelText: '변경하실 비밀번호를 입력해주세요'
              ),
            ),
            TextField(
              controller: pwCon3,
              decoration: const InputDecoration(
                labelText: '비밀번호 확인'
              ),
            ),
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('비밀번호 변경하기')
            ),
          ],
        ),
      ),
    );
  }
}