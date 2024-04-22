import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiagnosisViewPage extends StatelessWidget {
  const DiagnosisViewPage({super.key});

  // ---- View ----
  // Widget _buildItemWidget(doc) {
  //   final 
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 테스트 기록'),
      ),  
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
                .collection('dangjin')
                .orderBy('initdate', descending: false)
                .snapshots(), 
        builder: (context, snapshot) {
          if(!snapshot.hasData){const Center(child: CircularProgressIndicator(),);}
          var documents = snapshot.data!.docs;
          return ListView(
            // children: documents.map((e) => _buildItemWidget(e)).toList(),
          );
        },
      ),
    );
  }
}