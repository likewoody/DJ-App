import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_secondpage.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DiagnosisTestFirstPage extends StatelessWidget {
  const DiagnosisTestFirstPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(appBarTitle: "진단테스트"),
      body: ChangeNotifierProvider(
        create: (context) => VMDiagnosisTest(),
        builder: (context, child) {
          final vmSelectedValue = Provider.of<VMDiagnosisTest>(context);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  '한달 동안 운동을 하신적이 있습니까?',
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
                    title: const Text('Yes'),
                    value: 1,
                    groupValue: vmSelectedValue.exerciseradioVlaue,
                    onChanged: (value) {
                      vmSelectedValue.radioChange(value);
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
                    title: const Text('No'),
                    value: 0,
                    groupValue: vmSelectedValue.exerciseradioVlaue,
                    onChanged: (value) {
                      vmSelectedValue.radioChange(value);
                    },
                    selectedTileColor: Colors.transparent
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(DiagnosisTestSecondPage(
                          vmSelectedValue: vmSelectedValue,
                          exValue: vmSelectedValue.exerciseradioVlaue));
                    },
                    child: const Text('다음 질문')),
              ],
            ),
          );
        },
      ),
    );
  }
}//end

