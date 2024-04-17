import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _buildItemWidget(doc) {
    // final student = Student(code: doc['code'], name: doc['name'], dept: doc['dept'], phone: doc['phone']);
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_forever),
      ),
      // ************* data 이동 시킬 때 doc ***************
      key: ValueKey(doc),
      onDismissed: (direction) {
        FirebaseFirestore.instance
        .collection('students')
        .doc(doc.id)
        .delete();
      },
      // ************* data 이동 시킬 때 doc ***************
      // child: GestureDetector(
      //   onTap: () {
      //     Get.to(const Update(), arguments: [
      //       // id는 자동으로 관리되는 Property
      //       doc.id, 
      //       // id는 자동으로 관리되는 Property
      //       doc['code'],
      //       doc['name'],
      //       doc['dept'],
      //       doc['phone'],
      //     ]);
      //   },
      child: Card(
        child: ListTile(
          title: Text(
            "${doc['test']}"
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
                  .collection('test')
                  .snapshots(), 
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else {
              final documents = snapshot.data!.docs;
              return ListView(
                children: documents.map((e) => _buildItemWidget(e)).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}