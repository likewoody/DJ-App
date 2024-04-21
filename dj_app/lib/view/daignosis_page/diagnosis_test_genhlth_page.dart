import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_highbp_page.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DiagnosisGenHlthPage extends StatelessWidget {
  final box = GetStorage();
  DiagnosisGenHlthPage(
      {super.key});

  @override
  Widget build(BuildContext context) {
    print('============');
    print(box.read('consent'));
    print('============');
    print(box.read('fruit'));
    print('============');
    print(box.read('alcohol'));
    print('============');
    print(box.read('heart'));
    print('============');

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
                  '당신의 건강상태는?',
                  style: TextStyle(fontSize: 20),
                ),
                RadioListTile(
                  title: const Text('1'),
                  value: 1,
                  groupValue: vmSelectedValue.genhlthradioValue,
                  onChanged: (genHlthValue) {
                    vmSelectedValue.genHlthRadioChange(genHlthValue);
                  },
                ),
                RadioListTile(
                  title: const Text('2'),
                  value: 2,
                  groupValue: vmSelectedValue.genhlthradioValue,
                  onChanged: (genHlthValue) {
                    vmSelectedValue.genHlthRadioChange(genHlthValue);
                  },
                ),
                RadioListTile(
                  title: const Text('3'),
                  value: 3,
                  groupValue: vmSelectedValue.genhlthradioValue,
                  onChanged: (genHlthValue) {
                    vmSelectedValue.genHlthRadioChange(genHlthValue);
                  },
                ),
                RadioListTile(
                  title: const Text('4'),
                  value: 4,
                  groupValue: vmSelectedValue.genhlthradioValue,
                  onChanged: (genHlthValue) {
                    vmSelectedValue.genHlthRadioChange(genHlthValue);
                  },
                ),
                RadioListTile(
                  title: const Text('5'),
                  value: 5,
                  groupValue: vmSelectedValue.genhlthradioValue,
                  onChanged: (genHlthValue) {
                    vmSelectedValue.genHlthRadioChange(genHlthValue);
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      box.write('genHlth', vmSelectedValue.genhlthradioValue);
                      Get.to(DaignosisHighBPPage());
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
