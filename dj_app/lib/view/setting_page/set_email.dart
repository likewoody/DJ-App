import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/setting_appbar.dart';
import 'package:dj_app/vm/checkValidate.dart';
import 'package:dj_app/vm/vm_provider_common.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SetEmail extends StatelessWidget {
  SetEmail({super.key});

  // Property
  final TextEditingController textCon = TextEditingController();
  var provider;
  String userEmail = '';
  bool successfulChanged = false;
  final box = GetStorage();


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
            userEmail = provider.getStorageUserEmail();
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
          onPressed: () async {
            provider.inputEmail = textCon.text;
            provider.formKey.currentState!.validate();
            await provider.duplicatedEmailFirst();

            if(provider.duplicatedCheck2) {
              successfulChanged = true;
              box.write('successfulChanged', successfulChanged);
              box.write('changedEmail', textCon.text);
              provider.showSuccessfulAlert();
            }
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
        // email 설정
        print('cehck user Email from Firebase : ${provider.userEmail}}');
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
                    ElevatedButton(
                      onPressed: ()async{
                        provider.inputEmail = textCon.text;
                        provider.formKey.currentState!.validate();
                        await provider.duplicatedEmailFirst();
                        
                        if(provider.duplicatedCheck2) {
                          successfulChanged = true;
                          box.write('successfulChanged', successfulChanged);
                          box.write('changedEmail', textCon.text);
                          provider.showSuccessfulAlert();
                        }
                      },
                      child: const Text('이메일 설정'),
                    )
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
            controller: textCon,
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
    box.write('successfulChanged', successfulChanged);
    return SettingAppbar(titleName: '이메일 설정', builder: _streamBuidler(context));
  }
}
