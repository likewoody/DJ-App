import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_result_page.dart';
import 'package:dj_app/vm/login_view_model.dart';
import 'package:dj_app/vm/vm_dangjin_r.dart';
import 'package:dj_app/vm/vm_diagnosis.dart';
import 'package:dj_app/vm/vm_diagnosis_insert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DaignosisHighBPPage extends StatelessWidget {
  final vmInsert = VMDiagnosisInsert();
  final box = GetStorage();
  final DangjinRConnect dangjinRConnect = Get.put(DangjinRConnect());
  final LoginViewModel login = Get.put(LoginViewModel());

  DaignosisHighBPPage({super.key});

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
                    child: Text(
                      '고혈압이 있습니까?',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade800),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RadioListTile(
                    title: const Text(
                      'Yes',
                      style: TextStyle(fontSize: 18),
                    ),
                    value: 1,
                    groupValue: vmSelectedValue.highBpradioValue,
                    onChanged: (highBPValue) {
                      vmSelectedValue.highBpRadioChange(highBPValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  RadioListTile(
                    title: const Text(
                      'No',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    value: 0,
                    groupValue: vmSelectedValue.highBpradioValue,
                    onChanged: (highBPValue) {
                      vmSelectedValue.highBpRadioChange(highBPValue);
                    },
                    activeColor: Colors.brown.shade800,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        box.write('highBp', vmSelectedValue.highBpradioValue);
                        dangjinRConnect.alcohol =
                            box.read('alcohol').toString();
                        dangjinRConnect.fruit = box.read('fruit').toString();
                        dangjinRConnect.genHlth =
                            box.read('genHlth').toString();
                        dangjinRConnect.heart = box.read('heart').toString();
                        dangjinRConnect.highBp = box.read('highBp').toString();
                        QuerySnapshot querySnapshot = await FirebaseFirestore
                            .instance
                            .collection("user")
                            .where("email", isEqualTo: box.read('email'))
                            .get();

                        dangjinRConnect.gender =
                            querySnapshot.docs[0]['gender'].toString();
                        dangjinRConnect.age =
                            querySnapshot.docs[0]['birthday'].toString();
                        dangjinRConnect.height =
                            querySnapshot.docs[0]['height'].toString();
                        dangjinRConnect.weight =
                            querySnapshot.docs[0]['weight'].toString();
                        await dangjinRConnect.getDangjinRConnect();
                        if (box.read('consent') == 1) {
                          vmInsert.insertAction(
                              box.read('consent'),
                              box.read('fruit'),
                              box.read('alcohol'),
                              box.read('heart'),
                              box.read('genHlth'),
                              box.read('highBp'),
                              box.read('email'),
                              dangjinRConnect.result);
                        } else {
                          vmInsert.insertSQLite(
                            box.read('consent'),
                            box.read('fruit'),
                            box.read('alcohol'),
                            box.read('heart'),
                            box.read('genHlth'),
                            box.read('highBp'),
                            box.read('email'),
                            dangjinRConnect.result,
                          );
                        }
                        box.remove('consent');
                        box.remove('fruit');
                        box.remove('alcohol');
                        box.remove('heart');
                        box.remove('genHlth');
                        box.remove('highBp');
                        Get.to(const DiagnosisResultPage());
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
                      child: const Text('결과 보기')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
