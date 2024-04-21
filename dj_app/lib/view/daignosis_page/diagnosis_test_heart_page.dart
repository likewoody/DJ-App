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
    print('=======');
    print(box.read("consent"));
    print('=======');
    print(box.read("fruit"));
    print('=======');
    print(box.read("alcohol"));
    return Scaffold(
      appBar: const AppBarComponent(titleName: '',),
      body: ChangeNotifierProvider(
        create: (context) => VMDiagnosisTest(),
        builder: (context, child) {
          final vmSelectedValue = Provider.of<VMDiagnosisTest>(context);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  '심장 질환이 있습니까?',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.black)),
                  child: RadioListTile(
                    title: const Text('Yes'),
                    value: 1,
                    groupValue: vmSelectedValue.heartradioValue,
                    onChanged: (heartValue) {
                      vmSelectedValue.heartRadioChange(heartValue);
                    },
                  ),
                ),
                Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.black)),
                  child: RadioListTile(
                    title: const Text('No'),
                    value: 0,
                    groupValue: vmSelectedValue.heartradioValue,
                    onChanged: (heartValue) {
                      vmSelectedValue.heartRadioChange(heartValue);
                    },
                  ),
                ),
                ElevatedButton(onPressed: () {
                    box.write("heart", vmSelectedValue.heartradioValue);
                    Get.to(DiagnosisGenHlthPage());
                },
                child: const Text('다음 질문')),
              ],
            ),
          );
        },
      ),
    );
  }
}
