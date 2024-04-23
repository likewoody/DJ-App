import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_highbp_page.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DiagnosisGenHlthPage extends StatelessWidget {
  final box = GetStorage();
  DiagnosisGenHlthPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AppBarComponent(
        titleName: '',
      ),
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
                    child:  Text(
                      '내가 생각하는 나의 건강 상태는?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade800
                        ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  RadioListTile(
                    title: const Text(
                      '매우 좋음',
                      style: TextStyle(fontSize: 18),
                      ),
                    value: 1,
                    groupValue: vmSelectedValue.genhlthradioValue,
                    onChanged: (genHlthValue) {
                      vmSelectedValue.genHlthRadioChange(genHlthValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  RadioListTile(
                    title: const Text(
                      '좋음',
                      style: TextStyle(fontSize: 18),
                      ),
                    value: 2,
                    groupValue: vmSelectedValue.genhlthradioValue,
                    onChanged: (genHlthValue) {
                      vmSelectedValue.genHlthRadioChange(genHlthValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  RadioListTile(
                    title: const Text(
                      '보통',
                      style: TextStyle(fontSize: 18),
                      ),
                    value: 3,
                    groupValue: vmSelectedValue.genhlthradioValue,
                    onChanged: (genHlthValue) {
                      vmSelectedValue.genHlthRadioChange(genHlthValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  RadioListTile(
                    title: const Text(
                      '나쁨',
                      style: TextStyle(fontSize: 18),
                      ),
                    value: 4,
                    groupValue: vmSelectedValue.genhlthradioValue,
                    onChanged: (genHlthValue) {
                      vmSelectedValue.genHlthRadioChange(genHlthValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  RadioListTile(
                    title: const Text(
                      '매우 나쁨',
                      style: TextStyle(fontSize: 18),
                      ),
                    value: 5,
                    groupValue: vmSelectedValue.genhlthradioValue,
                    onChanged: (genHlthValue) {
                      vmSelectedValue.genHlthRadioChange(genHlthValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  SizedBox(height: 32,),
                  ElevatedButton(
                      onPressed: () {
                        box.write('genHlth', vmSelectedValue.genhlthradioValue);
                        Get.to(DaignosisHighBPPage());
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
                      child: const Text('다음 질문')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
