import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/vm/vm_provider_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetEmail extends StatelessWidget {
  final provider = VMProviderEmail();
  SetEmail({super.key, provider});

  // Property
  final TextEditingController textCon = TextEditingController();
  
  String id = '';
  
  // View
  Widget _bodyView(){
    // StreamBuilder
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
              .collection('user')
              // .orderBy(field)
              .snapshots(),
      builder: (context, snapshot) {
        if (! snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(),);
        }
        final documents = snapshot.data!.docs;
        // id 설정
        id = documents[0].id;

        // 실제 View 
        return Column(
          children: [
            
            // 이메일 주소 
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30,15,0,0),
                  child: Text(
                    '이메일 주소',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ),
              ],
            ),
            

            // 이메일 변경 입력
            Padding(
              padding: const EdgeInsets.fromLTRB(30,10,30,15),
              child: TextField(
                controller: textCon,
                decoration: const InputDecoration(
                  labelText: '이메일을 입력하세요',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  )
                ),
              ),
            ),
            const Text(
              'SNS로 가입한 계정은 수정이 불가능해요!',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                onPressed: () {
                  provider.email = textCon.text;
                  FirebaseFirestore.instance
                  .collection('user')
                  .doc(id)
                  .update(
                    {
                      'email' : provider.email
                    }
                  );
                  print(provider.email);
                  Get.back();
                }, 
                child: const Text('이메일 설정')
              ),
            ) 
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이메일 설정'),
      ),
      body: _bodyView(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
        ),
        height: 100,
        child: TextButton(
          onPressed: () {
            provider.email = textCon.text;
            FirebaseFirestore.instance
            .collection('user')
            .doc(id)
            .update(
              {
                'email' : provider.email
              }
            );
            print(provider.email);
            Get.back();
          }, 
          child: Text(
            '이메일 설정',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary
            ),
          ),
        ),
      ),
    );
  }
}