import 'package:dj_app/view/daignosis_page/diagnosis_test_consent_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Text.rich(
              TextSpan(
                text: '21세기 버킷리스트 중 하나\n',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
                children: [
                  TextSpan(
                    text: '건강한 삶 사는 거 아니었어?\n',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade600,
                    ),
                  ),
                  TextSpan(
                    text: '지금 당장 테스트 해봐',
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: Colors.brown.shade700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    minimumSize: const Size(100, 60),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    foregroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  Get.to(DiagnosisConsentPage());
                },
                icon: const Icon(Icons.add),
                label: const Text('테스트 하러 가기'))
          ],
        ),
      ),
    );
  }
}
