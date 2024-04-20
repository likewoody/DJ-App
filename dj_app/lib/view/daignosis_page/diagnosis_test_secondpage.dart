import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:dj_app/vm/vm_diagnosis_insert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiagnosisTestSecondPage extends StatelessWidget {
  final vmInsertValue = VMDiagnosisInsert();
  int exValue;
  DiagnosisTestSecondPage({super.key, vmSelectedValue, required this.exValue});

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
                '흡연을 하십니까?',
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
                  groupValue: vmSelectedValue.smokerradioVlaue,
                  onChanged: (smokerValue) {
                    vmSelectedValue.smokerRadioChange(smokerValue);
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
                  groupValue: vmSelectedValue.smokerradioVlaue,
                  onChanged: (smokerValue) {
                    vmSelectedValue.smokerRadioChange(smokerValue);
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    vmInsertValue.insertAction(exValue, vmSelectedValue.smokerradioVlaue);
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
