
import 'package:flutter/material.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3E3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '뭐하고 있었뇨?',
              style: TextStyle(
                fontSize: 30
              ),
            ),
            const Text(
              '당뇨',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
            ),
            const Text(
              '안녕~하세요!',
              style: TextStyle(
                fontSize: 30,
              ),
              ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                minimumSize: Size(100, 60),
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                foregroundColor: Theme.of(context).colorScheme.primary
              ),
              onPressed: () {
                //
              },
              icon: const Icon(Icons.add),
              label: const Text('테스트 하러 가기')
              )
          ],
        ),
      ),
    );
  }
}