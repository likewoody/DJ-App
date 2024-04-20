import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/vm/vm_provider.password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SetPassword extends StatelessWidget {
  // final provider = VMPRoviderPassword();
  SetPassword({super.key});

  // ---- Property ----
  final TextEditingController pwCon1 = TextEditingController();
  final TextEditingController pwCon2 = TextEditingController();
  final TextEditingController pwCon3 = TextEditingController();
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
          child: const Text('종료')
        ),
      ]
    );
  }

  Widget _bodyView(provider){
    return StreamBuilder(
      stream: FirebaseFirestore.instance
              .collection('user')
              // .orderBy(field),
              .snapshots(),
      builder: (context, snapshot) {
        if (! snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(),);
        }
        final documents = snapshot.data!.docs;
        // 현재 비밀번호 확인
        provider.currentPassword = documents[0].get('password');
        id = documents[0].id;

        return Padding(
          padding: const EdgeInsets.fromLTRB(0,110,0,0),
          child: Column(
            children: [
              // current password
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20,0,0),
                    child: Text('현재 비밀번호'),
                  ),
                ],
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: pwCon1,
                  decoration: const InputDecoration(
                    // labelText: '비밀번호를 입력해주세요',
                    hintText: '비밀번호를 입력해주세요',
                    hintFadeDuration: Duration(milliseconds: 100)
                  ),
                  obscureText: true,
                ),
              ),
          
              // 현재 비밀번호 틀렸을 시 에러 메시지 출력
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40,5,0,0),
                    child: Text(
                      provider.currentErrorMsg,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
          
          
          
              // new password
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 50,0,0),
                    child: Text('새로운 비밀번호'),
                  ),
                ],
              ),
          
              SizedBox(
                width: 350,
                child: TextField(
                  controller: pwCon2,
                  decoration: const InputDecoration(
                    // labelText: '변경하실 비밀번호를 입력해주세요',
                    hintText: '변경하실 비밀번호를 입력해주세요',
                    hintFadeDuration: Duration(milliseconds: 100)

                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,30,0,0),
                child: SizedBox(
                  width: 350,
                  child: TextField(
                    controller: pwCon3,
                    decoration: const InputDecoration(
                      hintText: '비밀번호 확인',
                      hintFadeDuration: Duration(milliseconds: 100)
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  onPressed: () {
                    provider.fNewPassword = pwCon2.text;
                    provider.sNewPassword = pwCon3.text;
                    provider.inputCurrentPassword = pwCon1.text;
                    // 현재 비밀번호가 틀렸을 때 에러 스낵바
                    provider.curPasswordCheck();
                    provider.newPasswordCheck();
          
                    if(provider.successfulChanged){
                      provider.password = pwCon2.text;
                      FirebaseFirestore.instance
                      .collection('user')
                      .doc(id)
                      .update(
                        {
                          'password' : pwCon2.text
                        }
                      );
                      print(pwCon2.text);
                      _showSuccessfulAlert();
                    }
                  }, 
                  child: const Text('비밀번호 변경하기')
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<VMPRoviderPassword>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: const Text('비밀번호 설정'),
        ),
      
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ChangeNotifierProvider<VMPRoviderPassword>(
            create: (context) => VMPRoviderPassword(),
            builder: (context, child) {
              provider = Provider.of<VMPRoviderPassword>(context);
              return _bodyView(provider);
            },
          ),
        ),
      
      
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
          ),
          height: 100,
          child: TextButton(
            onPressed: () {
              provider.fNewPassword = pwCon2.text;
              provider.sNewPassword = pwCon3.text;
              provider.inputCurrentPassword = pwCon1.text;
              // 현재 비밀번호가 틀렸을 때 에러 스낵바
              provider.curPasswordCheck();
              provider.newPasswordCheck();

              if(provider.successfulChanged){
                provider.password = pwCon2.text;
                FirebaseFirestore.instance
                .collection('user')
                .doc(id)
                .update(
                  {
                    'password' : pwCon2.text
                  }
                );
                print(pwCon2.text);
                _showSuccessfulAlert();
              }
            }, 
            child: Text(
              '비밀번호 설정',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary
              ),
            ),
          ),
        ),
      ),
    );
  }
}