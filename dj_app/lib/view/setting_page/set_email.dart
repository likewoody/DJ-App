import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/setting_appbar.dart';
import 'package:dj_app/vm/checkValidate.dart';
import 'package:dj_app/vm/vm_provider_common.dart';
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
  bool emailCheck = false;
  String userEmail = 'sdakfdslkf@naver.com';
  


  // ---- Functions ----
  _emailCheck() async{
    var checkEmail = FirebaseFirestore.instance
      .collection('user')
      .where('email', isEqualTo: textCon.text)
      .snapshots();

    print('check1');
    checkEmail.listen((QuerySnapshot snapshot) { 
      emailCheck = false;
      // 쿼리 처리 결과
      snapshot.docs.forEach((DocumentSnapshot document) { 
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        // data['email'] == userEmail
        emailCheck = true;
        // : emailCheck = true;
        
        print('Email : ${data['email']}');
      });
      print(emailCheck);
      print('successful accessed');
    });
  }


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
        child: ChangeNotifierProvider<VMProviderCommon>(
          create: (context) => VMProviderCommon(),
          builder: (context, child) {
            provider = Provider.of<VMProviderCommon>(context);
            provider.whichOne = '이메일';
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
            // _emailCheck();
            // provider.email = textCon.text;
            // FirebaseFirestore.instance
            //     .collection('user')
            //     .doc(id)
            //     .update({'email': provider.email});
            // print(provider.email);
            // provider.showSuccessfulAlert();
            provider.showSuccessfulAlert();
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

              // 이메일 변경 입력
              Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    _showEmailInput(),
                    const Text(
                      'SNS로 가입한 계정은 수정이 불가능해요!',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    provider.showOkBtn('이메일 설정'),
                  ],
                )
              ),
            ],
          ),
        );
      },
    );
  }

  // ---- View 3 ----
  Widget _showEmailInput(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 15),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: provider.emailFocus,
            decoration: provider.textFormDecoration('Email', '   이메일을 입력해주세요')
            .copyWith(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            ),
            validator: (value) => CheckValidate().validateEmail(provider.emailFocus, value!),
          )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<VMProviderEmail>(context);
    return SettingAppbar(titleName: '이메일 설정', builder: _streamBuidler(context));
  }
}
