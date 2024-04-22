import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/model/model_diagnosis.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiagnosisViewPage extends StatelessWidget {
  DiagnosisViewPage({super.key});

  // 이메일 받아와야 함
  // 이메일 받아와야 함
  // 이메일 받아와야 함
  // 이메일 받아와야 함
  // 이메일 받아와야 함
  String email = '1231@naver.com';
  // 이메일 받아와야 함
  // 이메일 받아와야 함
  // 이메일 받아와야 함
  // 이메일 받아와야 함
  String result = '';
  String initDate = '';



  // ---- View ----
  Widget _buildItemWidget(doc) {
    final diagnosis = Diagnosis(alcohol: doc['alcohol'], consent: doc['consent'], fruit: doc['fruit'], genhlth: doc['genhlth'], heart: doc['heart'], highBp: doc['highBp'], initdate: doc['initDate']);
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_forever),
      ),
      key: ValueKey(doc), 
      onDismissed: (direction) {
      FirebaseFirestore.instance
        .collection('dangjin')
        .doc(doc.id)
        .delete();
      },
      child: GestureDetector(
      onTap: () {
        Get.to(const DiagnosisResultPage(), arguments: [
	        // id는 자동으로 관리되는 Property
          doc.id, 
          doc['email'],
        ]);
      },
      child: Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("당뇨병 검사결과 : ${diagnosis.result}%입니다."),
              Text("날짜 : ${diagnosis.initdate}")
              ],
            ),
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 테스트 기록'),
      ),  
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
                  .collection('dangjin')
                  // .orderBy('initdate', descending: false)
                  // .where('email', isEqualTo: email)
                  .snapshots(), 
          builder: (context, snapshot) {
            if(!snapshot.hasData){const Center(child: CircularProgressIndicator(),);}
        
            print(snapshot.data);
            print(snapshot.data!.docs);
            // final documents = snapshot.data!.docs;
            return ListView(
              // children: documents.map((e) => _buildItemWidget(e)).toList(),
            );
          },
        ),
      ),
    );
  }
}