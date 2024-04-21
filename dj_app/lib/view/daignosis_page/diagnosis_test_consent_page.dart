import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_fruitpage.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DiagnosisConsentPage extends StatelessWidget {
  final box = GetStorage();
  DiagnosisConsentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: ChangeNotifierProvider(
          create: (context) => VMDiagnosisTest(),
          builder: (context, child) {
            final vmSelectedValue = Provider.of<VMDiagnosisTest>(context);
            return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  '개인정보 수집 및 이용에 동의해 주세요',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.black)
                  ),
                  child: RadioListTile(
                    title: const Text('동의'),
                    value: 1,
                    groupValue: vmSelectedValue.consentradioValue,
                    onChanged: (consentValue) {
                      vmSelectedValue.consentRadioChange(consentValue);
                    },
                  ),
                ),
                Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.black)
                  ),
                  child: RadioListTile(
                    title: const Text('동의 안함'),
                    value: 0,
                    groupValue: vmSelectedValue.consentradioValue,
                    onChanged: (consentValue) {
                      vmSelectedValue.consentRadioChange(consentValue);
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      box.write('consent', vmSelectedValue.consentradioValue);
                      Get.to(DiagnosisTestFruitPage());
                    },
                    child: const Text('테스트 시작하기')),
              ],
            ),
          );
          },
        ),
    );
  }
}