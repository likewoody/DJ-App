import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_genhlth_page.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DiagnosisHeartPage extends StatelessWidget {
  final box = GetStorage();
  DiagnosisHeartPage({super.key});

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
            child: Stack(
              children: [
                Image.asset('images/diagnosis_page.png'),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '심장 질환이 있습니까?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade800
                        ),
                    ),
                    const SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: RadioListTile(
                        title: const Text(
                          'Yes',
                          style: TextStyle(fontSize: 18),
                          ),
                        value: 1,
                        groupValue: vmSelectedValue.heartradioValue,
                        onChanged: (heartValue) {
                          vmSelectedValue.heartRadioChange(heartValue);
                        },
                        activeColor: Colors.brown.shade800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: RadioListTile(
                        title: const Text(
                          'No',
                          style: TextStyle(fontSize: 18),
                          ),
                        value: 0,
                        groupValue: vmSelectedValue.heartradioValue,
                        onChanged: (heartValue) {
                          vmSelectedValue.heartRadioChange(heartValue);
                        },
                        activeColor: Colors.brown.shade800,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        onPressed: () {
                          box.write("heart", vmSelectedValue.heartradioValue);
                          Get.to(DiagnosisGenHlthPage());
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
              ],
            ),
          );
        },
      ),
    );
  }
}
