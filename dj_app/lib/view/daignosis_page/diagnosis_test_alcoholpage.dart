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
    print('=======');
    print(box.read("consent"));
    print('=======');
    print(box.read("fruit"));
    return Scaffold(
      appBar: const AppBarComponent(titleName: ''),
      body: ChangeNotifierProvider(
        create: (context) => VMDiagnosisTest(),
        builder: (context, child) {
          final vmSelectedValue = Provider.of<VMDiagnosisTest>(context);
          return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: [
                  Text(
                    '일주일에 음주를 하시나요?',
                    style: TextStyle(fontSize: 20),
                  ),
              Text(
                '(맥주 기준 남성 14잔 이상, 여성 7잔 이상)',
                style: TextStyle(fontSize: 20),
              ),
                ],
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
                  groupValue: vmSelectedValue.alcoholradioVlaue,
                  onChanged: (alcoholValue) {
                    vmSelectedValue.alcoholradioChange(alcoholValue);
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
                  groupValue: vmSelectedValue.alcoholradioVlaue,
                  onChanged: (alcoholValue) {
                    vmSelectedValue.alcoholradioChange(alcoholValue);
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    box.write('alcohol', vmSelectedValue.alcoholradioVlaue);
                    Get.to(DiagnosisHeartPage());
                  },
                  child: const Text('다음 질문')),
            ],
          )
        );
        },
      ),
    );
  }
}
