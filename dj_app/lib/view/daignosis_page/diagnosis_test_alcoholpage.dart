import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_heart_page.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DiagnosisTestAlcoholPage extends StatelessWidget {
  final box = GetStorage();
  DiagnosisTestAlcoholPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AppBarComponent(titleName: ''),
      body: ChangeNotifierProvider(
        create: (context) => VMDiagnosisTest(),
        builder: (context, child) {
          final vmSelectedValue = Provider.of<VMDiagnosisTest>(context);
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.brown.shade100,
                  Colors.brown.shade50,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '일주일에 음주를 하시나요?\n(맥주 기준 남성 14잔 이상, 여성 7잔 이상)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  RadioListTile(
                    title: const Text(
                      'Yes',
                      style: TextStyle(fontSize: 18),
                    ),
                    value: 1,
                    groupValue: vmSelectedValue.alcoholradioVlaue,
                    onChanged: (alcoholValue) {
                      vmSelectedValue.alcoholradioChange(alcoholValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  RadioListTile(
                    title: const Text(
                      'No',
                      style: TextStyle(fontSize: 18),
                    ),
                    value: 0,
                    groupValue: vmSelectedValue.alcoholradioVlaue,
                    onChanged: (alcoholValue) {
                      vmSelectedValue.alcoholradioChange(alcoholValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      box.write('alcohol', vmSelectedValue.alcoholradioVlaue);
                      Get.to(DiagnosisHeartPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade800,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      '다음 질문',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
