import 'package:flutter/material.dart';

class Enquire extends StatelessWidget {
  Enquire({super.key});

  TextEditingController enquireCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('문의하기'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('문의'),
          TextField(
            controller: enquireCon,
          ),
        ],
      ),
    );
  }
}