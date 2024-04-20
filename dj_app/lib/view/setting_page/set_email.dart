import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/setting_appbar.dart';
import 'package:dj_app/vm/vm_provider_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SetEmail extends StatelessWidget {
  // final id;
  SetEmail({super.key});
  // SetEmail({super.key, required this.id});

  // Property
  final TextEditingController textCon = TextEditingController();
  var provider;
  String id = '';

  // ---- Functions ----
  _showSuccessfulAlert() {
    Get.defaultDialog(
        title: '변경 완료',
        middleText: '비밀번호 변경이 완료 되었습니다.',
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('종료')),
        ]);
  }

  // ---- View 1 ----
  Widget _streamBuidler(context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ChangeNotifierProvider<VMProviderEmail>(
          create: (context) => VMProviderEmail(),
          builder: (context, child) {
            provider = Provider.of<VMProviderEmail>(context);
            return _bodyView(provider);
          },
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        height: 100,
        child: TextButton(
          onPressed: () {
            provider.email = textCon.text;
            FirebaseFirestore.instance
                .collection('user')
                .doc(id)
                .update({'email': provider.email});
            print(provider.email);
            _showSuccessfulAlert();
          },
          child: Text(
            '이메일 설정',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }

  // ---- View 2 ----
  Widget _bodyView(provider) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('user')
          // .orderBy(field)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final documents = snapshot.data!.docs;
        // id 설정
        // id = documents[0].id;

        // 실제 View
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
          child: Column(
            children: [
              // 이메일 주소
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                    child: Text(
                      '이메일 주소',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),

              // 이메일 변경 입력
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
                child: TextField(
                  controller: textCon,
                  decoration: const InputDecoration(
                      hintText: '이메일을 입력하세요.',
                      hintFadeDuration: Duration(milliseconds: 100),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
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
                          .update({'email': provider.email});
                      print(provider.email);
                      _showSuccessfulAlert();
                    },
                    child: const Text('이메일 설정')),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<VMProviderEmail>(context);
    return SettingAppbar(titleName: '이메일 설정', builder: _streamBuidler(context));
  }
}
