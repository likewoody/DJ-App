import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/view/setting_page/enquire.dart';
import 'package:dj_app/view/setting_page/enquire_list.dart';
import 'package:dj_app/view/setting_page/personal_info.dart';
import 'package:dj_app/view/setting_page/service_info.dart';
import 'package:dj_app/view/setting_page/set_alarm.dart';
import 'package:dj_app/view/setting_page/set_email.dart';
import 'package:dj_app/view/setting_page/set_height_weight.dart';
import 'package:dj_app/view/setting_page/set_password.dart';
import 'package:dj_app/view/tabbar.dart';
import 'package:dj_app/vm/vm_provider_height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  final provider = VMProviderHeightWeight();
  SettingPage({super.key, provider});

  // 이메일 받아야 함
  // 이메일 받아야 함
  // 이메일 받아야 함
  // 이메일 받아야 함
  // 이메일 받아야 함
  // 이메일 받아야 함
  // Property
  final String email = 'sdakfdslkf@naver.com';
  final String height = '170';
  final String weight = '70';
  String joinDate = '';
  String id = '';


  // ***************************************
  // *****************View******************
  // ***************************************
  // 이메일, 가입일자, 가입 방법
  Widget userInfoSetPage(){
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20,20,0,0),
          child: Row(
            children: [
              Text(
                '내 가입정보',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 고객이 SNS를 이용하여 가입했다면 그 SNS 로고 넣기
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Image.asset(
            //     'images/Kakao_logo.jpg',
            //     width: 30,
            //     height: 30,
            //     fit: BoxFit.fill,
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(email),
            ),

            // 가입일자, 무슨 방법으로 가입했는지
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('$joinDate 카카오 간편가입'),
            )
          ],
        ),
      ],
    );
  }
  // ***************************************



  // ***************************************
  // 고객 정보 수정하기
  Widget updateInfoPage(){
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20,15,0,0),
              child: Text(
                '계정설정',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),
              ),
            ),
          ],
        ),

        // 키 몸무게 설정 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('키/몸무게 설정'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,5),
              child: IconButton(
                onPressed: () => Get.to(
                  SetHeightWeight(),
                ), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
              
            ),
          ],
        ),

        // 이메일 설정
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('이메일 설정'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,5),
              child: IconButton(
                onPressed: () => Get.to(SetEmail()), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
            ),
          ],
        ),

        // 비밀번호 설정 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('비밀번호 설정'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,5),
              child: IconButton(
                onPressed: () => Get.to(SetPassword()), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
            ),
          ],
        ),

        // 알림 설정 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('알림 설정'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,5),
              child: IconButton(
                onPressed: () =>  Get.to(SetAlarm()), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
            ),
          ],
        ),
      ],
    );
  }
  // ***************************************


  // ***************************************
  // 앱 정보
  Widget appInfoPage(){
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20,15,0,0),
              child: Text(
                '도움',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),
              ),
            ),
          ],
        ),
        // 문의하기
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('문의하기'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,5),
              child: IconButton(
                onPressed: () => Get.to(Enquire()), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
            ),
          ],
        ),
        // 문의내역
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('문의내역'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,5),
              child: IconButton(
                onPressed: () => Get.to(EnquireList()), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
            ),
          ],
        ),


        // 버전정보
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('버전정보'),
            ),
          ],
        ),


        const Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20,0,0,5),
              child: Text(
                '현재 1.0.0 / 최신 1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),
              ),
            ),
          ],
        ),


        // 서비스 이용약관
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('서비스 이용약관'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,0),
              child: IconButton(
                onPressed: () => Get.to(const ServiceInfo()), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
            ),
          ],
        ),



        // 개인 정보 처리방침
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,0,5),
              child: Text('개인 정보 처리방침'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,15,0),
              child: IconButton(
                onPressed: () => Get.to(const PersonalInfo()), 
                icon:const  Icon(Icons.arrow_forward_ios)
              ),
            ),
          ],
        ),
      ],
    );
  }
  // ***************************************
  // *****************View******************
  // ***************************************



  // ---- Function ----
  Widget deletePage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15,5,0,5),
          child: TextButton(
            onPressed: () {
              _deleteAlert();
            }, 
            child: const Text(
              '탈퇴하기',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
        ),
      ],
    );
  }

  _deleteAlert() {
    Get.defaultDialog(
      title: '알림',
      middleText: '탈퇴 하시겠습니까?',
      actions: [
        TextButton(
          onPressed: () => Get.back(), 
          child: const Text('아니요')
        ),
        TextButton(
          onPressed: () {
            _executeDelete();
            Get.off(const Tabbar());
          },
          child: const Text('예')
        ),
      ]
    );
  }

  _executeDelete() async{
    await FirebaseFirestore.instance
      .collection('user')
      .doc(id)
      .delete();

    print(id);
    print(email);
    print('Successful Delete User Info');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: const SizedBox(
            child: Text('설정'),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
                  .collection('user')
                  .where('email', isEqualTo: email)
                  .snapshots(),
          builder: (context, snapshot) {
            if (! snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
            var documents = snapshot.data!.docs;
            if(documents.isNotEmpty) {
              joinDate = documents[0].get('date');
              id = documents[0].id;  
            }
            print(email);
            print(id);
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
              
                  userInfoSetPage(),
              
                  // Divider
                  const Divider(
                    thickness: 1,
                  ),
              
              
                  updateInfoPage(),
              
                  // Divider
                  const Divider(
                    thickness: 1,
                  ),
              
                  appInfoPage(),
            
                  // Divider
                  const Divider(
                    thickness: 1,
                  ),
            
                  deletePage(),
                  
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}