import 'package:dj_app/view/setting_page/enquire.dart';
import 'package:dj_app/view/setting_page/set_alarm.dart';
import 'package:dj_app/view/setting_page/set_email.dart';
import 'package:dj_app/view/setting_page/set_height_weight.dart';
import 'package:dj_app/view/setting_page/set_password.dart';
import 'package:dj_app/vm/vm_provider_height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  final provider = VMProviderHeightWeight();
  SettingPage({super.key, provider});

  // Property
  final String id = 'test';
  final String height = '170';
  final String weight = '70';


  // ***************************************
  // *****************View******************
  // ***************************************
  // 이메일, 가입일자, 가입 방법
  Widget userInfo(){
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20,0,0,0),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'images/Kakao_logo.jpg',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),

            Text(id),

            // 가입일자, 무슨 방법으로 가입했는지
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('OO.OO.OO 카카오 간편가입'),
            )
          ],
        ),
      ],
    );
  }
  // ***************************************



  // ***************************************
  // 고객 정보 수정하기
  Widget updateInfo(){
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
  Widget appInfo(){
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
                onPressed: () => Get.to(Enquire()), 
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
                // 구현 기능
                onPressed: (){}, 
                // 구현 기능
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
                // 구현 기능
                onPressed: (){}, 
                // 구현 기능
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('설정'),
          // leading: IconButton(
          //   onPressed: onPressed, 
          //   icon: icon
          // ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
          
              userInfo(),
          
              // Divider
              const Divider(
                thickness: 1,
              ),
          
          
              updateInfo(),
          
              // Divider
              const Divider(
                thickness: 1,
              ),
          
              appInfo(),
              
            ],
          ),
        ),
      ),
    );
  }
}