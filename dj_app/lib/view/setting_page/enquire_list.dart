import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/model/model_enquire.dart';
import 'package:flutter/material.dart';


class EnquireList extends StatelessWidget {
  EnquireList({super.key});

  // Property
  var provider;
  String userEmail = 'sdakfdslkf@naver.com';
  // 이메일 넘겨 받아야 한다
// 이메일 넘겨 받아야 한다
// 이메일 넘겨 받아야 한다
// 이메일 넘겨 받아야 한다
// 이메일 넘겨 받아야 한다

  Widget _bodyView(doc) {
    final enquireList = ModelEnquire(title: doc['title'], context: doc['context'], date: doc['date'], image: doc['image']);
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
        .collection('enquire')
        .doc(doc.id)
        .delete();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "제목: ${enquireList.title}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                initialValue: enquireList.context,
                maxLines: null, // 여러 줄 입력 가능하도록 설정
                decoration: const InputDecoration(
                  hintText: "내용을 입력하세요",
                  border: OutlineInputBorder(),
                ),
                readOnly: true, // 읽기 전용 모드로 설정
              ),
              const SizedBox(height: 16.0),
              Text("날짜: ${enquireList.date}"),
              if (enquireList.image != null) 
                Image.network(enquireList.image),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('문의내역'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
                .collection('enquire')
                // .orderBy(field),
                .where('email', isEqualTo: userEmail)
                .snapshots(), 
        builder: (context, snapshot) {
          if (! snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(),);
          }
          var documents = snapshot.data!.docs;
          return ListView(
            children: documents.map((e) => _bodyView(e)).toList(),
          );
        },
      ),
    );
  }
}