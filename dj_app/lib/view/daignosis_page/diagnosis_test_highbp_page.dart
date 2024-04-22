import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_result_page.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:dj_app/vm/vm_diagnosis_insert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DaignosisHighBPPage extends StatelessWidget {
  final vmInsert = VMDiagnosisInsert();
  final box = GetStorage();

  DaignosisHighBPPage({super.key});

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
    print(box.read('genHlth'));
    print('============');
    return Scaffold(
      appBar: const AppBarComponent(
        titleName: '',
      ),
      body: ChangeNotifierProvider(
        create: (context) => VMDiagnosisTest(),
        builder: (context, child) {
          final vmSelectedValue = Provider.of<VMDiagnosisTest>(context);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  '고혈압이 있습니까??',
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
                    groupValue: vmSelectedValue.highBpradioValue,
                    onChanged: (highBPValue) {
                      vmSelectedValue.highBpRadioChange(highBPValue);
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
                    groupValue: vmSelectedValue.highBpradioValue,
                    onChanged: (highBPValue) {
                      vmSelectedValue.highBpRadioChange(highBPValue);
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      box.write('highBp', vmSelectedValue.highBpradioValue);
                      if (box.read('consent') == 1) {
                        vmInsert.insertAction(
                            box.read('consent'),
                            box.read('fruit'),
                            box.read('alcohol'),
                            box.read('heart'),
                            box.read('genHlth'),
                            box.read('highBp'));
                      } else {
                        vmInsert.insertSQLite(
                            box.read('consent'),
                            box.read('fruit'),
                            box.read('alcohol'),
                            box.read('heart'),
                            box.read('genHlth'),
                            box.read('highBp'));
                      }
                      
                      box.erase();
                      Get.to(DiagnosisResultPage());
                    },
                    child: const Text('결과 보기')),
              ],
            ),
          );
        },
      ),
    );
  }
  
}
