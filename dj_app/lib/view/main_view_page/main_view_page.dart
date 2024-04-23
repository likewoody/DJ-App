import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_consent_page.dart';
import 'package:dj_app/view/setting_page/set_height_weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainViewPage extends StatelessWidget {
  MainViewPage({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3E3),
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'images/main_page.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                const Expanded(
                  child:
                      SizedBox(), // Expanded를 추가하여 엘리베이티드 버튼이 화면의 아래로 이동하도록 설정합니다.
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(130, 0, 0, 50), // 버튼과 하단 간격 조정
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(100, 60),
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      QuerySnapshot querySnapshot = await FirebaseFirestore
                          .instance
                          .collection("user")
                          .where("email", isEqualTo: box.read('email'))
                          .get();

                      if (querySnapshot.docs[0]['weight'] == 0 &&
                          querySnapshot.docs[0]['height'] == 0) {
                        _showDialog();
                      } else {
                        Get.to(DiagnosisConsentPage());
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('테스트 하러 가기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  _showDialog() {
    Get.defaultDialog(
      title: "경고",
      middleText: '키와 몸무게를 설정해 주세요.',
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.to(SetHeightWeight());
          },
          child: const Text('이동'),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('취소'),
        ),
      ],
    );
  }
}
