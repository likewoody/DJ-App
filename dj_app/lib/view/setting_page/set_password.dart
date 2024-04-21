import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/setting_appbar.dart';
import 'package:dj_app/vm/checkValidate.dart';
import 'package:dj_app/vm/vm_provider_common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPassword extends StatelessWidget {
  // final provider = VMPRoviderPassword();
  SetPassword({super.key});

  // ---- Property ----
  final TextEditingController pwCon1 = TextEditingController();
  final TextEditingController pwCon2 = TextEditingController();
  final TextEditingController pwCon3 = TextEditingController();
  var provider;
  // 이메일 받아야함
  // 이메일 받아야함
  // 이메일 받아야함// 이메일 받아야함
  // 이메일 받아야함
  // 이메일 받아야함
  // 이메일 받아야함
  String email = 'sdakfdslkf@naver.com';
  // 이메일 받아야함
  // 이메일 받아야함
  // 이메일 받아야함
  // 이메일 받아야함
  // 이메일 받아야함// 이메일 받아야함

  // ---- View 1 ----
  _streamBuidler(context){
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ChangeNotifierProvider<VMProviderCommon>(
          create: (context) => VMProviderCommon(),
          builder: (context, child) {
            provider = Provider.of<VMProviderCommon>(context);
            provider.whichOne = '비밀번호';
            provider.email = email;
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
          provider.inputCurrentPassword = pwCon1.text;
          provider.fNewPassword = pwCon2.text;
          provider.sNewPassword =  pwCon3.text;
          print('pwCon1.text : ${pwCon1.text}');
          print('pwCon2.text : ${pwCon2.text}');
          print('pwCon3.text : ${pwCon3.text}');
          // 현재 비밀번호가 틀렸을 때 에러 스낵바
          provider.curPasswordCheck();
          provider.newPasswordCheck();
          print("1 ${provider.successfulChanged1}");
          print("2 ${provider.successfulChanged2}");
          if(provider.successfulChanged1 && provider.successfulChanged2){
            provider.updateEmail();
            print("successfully, changed password to :${pwCon3.text}");
            provider.showSuccessfulAlert();
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
    );
  }


  // ---- View 2 ----
  Widget _bodyView(provider){
    return StreamBuilder(
      stream: FirebaseFirestore.instance
              .collection('user')
              // .orderBy(field),
              .where('email', isEqualTo: email)
              .snapshots(),
      builder: (context, snapshot) {
        if (! snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(),);
        }
        final documents = snapshot.data!.docs;
        // 현재 비밀번호 확인
        provider.currentPassword = documents[0].get('password');

        // id = documents[0].id;

        return Padding(
          padding: const EdgeInsets.fromLTRB(0,110,0,0),
          child: Column(
            children: [
              // current password
              
              Form(
                key: provider.formKey,
                child: Center(
                  child: Column(
                    children: [
                      _showPasswordInput(),
                      provider.showOkBtn('비밀번호 변경하기'),

                    ],
                  ),
                )
              ),
            ],
          ),
        );
      },
    );
  }

  // ---- View 3 -----
  Widget _showPasswordInput(){
    return Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20,0,0),
                child: Text('현재 비밀번호'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 50),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: pwCon1,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: ' 현재 비밀번호 확인',
                    hintFadeDuration: Duration(milliseconds: 100)
                  ),
                ),
              )
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40,0,0,0),
                child: Text('새로운 비밀번호'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
              child: TextFormField(
                controller: pwCon2,
                focusNode: provider.passwordFocus,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: provider.textFormDecoration('새로운 비밀번호', '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.')
                .copyWith(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                ),
                validator: (value) => CheckValidate().validatePassword(provider.passwordFocus, value!),
              )
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 40),
              child: SizedBox(
                height: 46,
                child: TextField(
                  controller: pwCon3,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: ' 새로운 비밀번호 확인',
                    hintFadeDuration: Duration(milliseconds: 100)
                  ),
                ),
              )
          ),
        ],  
      );
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<VMPRoviderPassword>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SettingAppbar(titleName: '비밀번호 설정', builder: _streamBuidler(context)),
    );
  }
}