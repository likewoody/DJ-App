import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_test_alcoholpage.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DiagnosisTestFruitPage extends StatelessWidget {
  final box = GetStorage();
  DiagnosisTestFruitPage({super.key,});
  
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
                  '과일을 섭취 하십니까?',
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
                    groupValue: vmSelectedValue.fruitradioVlaue,
                    onChanged: (fruitValue) {
                      vmSelectedValue.fruitRadioChange(fruitValue);
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
                    groupValue: vmSelectedValue.fruitradioVlaue,
                    onChanged: (fruitValue) {
                      vmSelectedValue.fruitRadioChange(fruitValue);
                    },
                    selectedTileColor: Colors.transparent
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      box.write('fruit', vmSelectedValue.fruitradioVlaue);
                      Get.to(DiagnosisTestAlcoholPage());
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

