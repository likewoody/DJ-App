import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/setting_appbar.dart';
import 'package:dj_app/vm/checkValidate.dart';
import 'package:dj_app/vm/vm_provider_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SetPassword extends StatelessWidget {
  SetPassword({super.key});

  // ---- Property ----
  final TextEditingController pwCon1 = TextEditingController();
  final TextEditingController pwCon2 = TextEditingController();
  final TextEditingController pwCon3 = TextEditingController();
  var provider;
  String userEmail = '';
  bool apiUser = false;

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
            userEmail = provider.getStorageUserEmail();
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
            if(apiUser ) {
              provider.showWarnSanckBar();
            } else{
              provider.formKey.currentState!.validate();
              _clickButton();
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
              .where('email', isEqualTo: userEmail)
              .snapshots(),
      builder: (context, snapshot) {
        if (! snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(),);
        }
        final documents = snapshot.data!.docs;
        // 현재 비밀번호 확인
        try {
          if(documents[0].get('password').isEmpty) {
            Get.back();
            provider.showWarnSanckBar();
          } else {
            provider.currentPassword = documents[0].get('password');
          }
        } catch (e) {
          apiUser = true;
          e.printError();
        }
        print(apiUser);

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
                      ElevatedButton(
                        child: const Text('비밀번호 변경하기'),
                        onPressed: (){
                          if(apiUser ) {
                            provider.showWarnSanckBar();
                          } else{
                            provider.formKey.currentState!.validate();
                            _clickButton();
                          }
                        },
                      ),
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
                    hintFadeDuration: Duration(milliseconds: 100),
                  ),
                  readOnly: apiUser,
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
                readOnly: apiUser,
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
                  readOnly: apiUser,
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

  _clickButton(){
    provider.inputCurrentPassword = pwCon1.text;
    provider.fNewPassword = pwCon2.text;
    provider.sNewPassword =  pwCon3.text;
    print('pwCon1.text : ${pwCon1.text}');
    print('pwCon2.text : ${pwCon2.text}');
    print('pwCon3.text : ${pwCon3.text}');
    provider.curPasswordCheck();
    if(provider.changePassword()){
      provider.showSuccessfulAlert();
    };
  }

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SettingAppbar(titleName: '비밀번호 설정', builder: _streamBuidler(context)),
    );
  }
}