import 'package:dj_app/view/signup_1st_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Property
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: TextField(
                  maxLength: 20,
                  controller: userIdController,
                  decoration: const InputDecoration(
                    counterText: '', // 화면에 표시되는 maxLength 제거.
                    labelText: '아이디(이메일)',
                    hintText: '아이디(이메일)를 입력해주시기 바랍니다.',
                    hintFadeDuration: Duration(milliseconds: 500),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 20,
                      color: Color(0xFF0C0C0C),
                      backgroundColor: Color(0xFFF9F3E3), // 0xFF는 불투명도(opacity)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
      
                  // -----------------------------------------------------------
      
                  keyboardType: TextInputType.text,
      
                  // -----------------------------------------------------------
      
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    //
                  },
                ),
              ),
      
              // ---------------------------------------------------------------
      
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextField(
                  maxLength: 20,
                  controller: passwordController,
                  obscureText: true, // 비밀번호 마스킹 처리.
                  decoration: const InputDecoration(
                    counterText: '', // 화면에 표시되는 maxLength 제거.
                    labelText: '비밀번호',
                    hintText: '비밀번호를 입력해주시기 바랍니다.',
                    hintFadeDuration: Duration(milliseconds: 500),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 20,
                      color: Color(0xFF0C0C0C),
                      backgroundColor: Color(0xFFF9F3E3), // 0xFF는 불투명도(opacity)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
      
                  // -----------------------------------------------------------
      
                  keyboardType: TextInputType.text,
      
                  // -----------------------------------------------------------
      
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    //
                  },
                ),
              ),
      
              // ---------------------------------------------------------------
      
              SizedBox(
                width: 390,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFF9F3E3), // 0xFF는 불투명도(opacity)
                    foregroundColor: const Color(0xFF0C0C0C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
                    '로그인 하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
      
              // ---------------------------------------------------------------
      
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 5),
                child: Text(
                  'SNS계정으로 로그인하기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
              // ---------------------------------------------------------------
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Image.asset(
                      'images/naver.png',
                      width: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Image.asset(
                      'images/kakao.png',
                      width: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Image.asset(
                      'images/google.png',
                      width: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Image.asset(
                      'images/apple.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
      
              // ---------------------------------------------------------------
      
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                child: SizedBox(
                  width: 390,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        () => SignUp1stPage(),
                        transition: Transition.zoom,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF0C0C0C),
                    ),
                    child: const Text(
                      '계정이 없으신가요? 간편가입하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
      
              // ---------------------------------------------------------------
      
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Divider(
                  thickness: 1,
                  height: 1,
                ),
              ),
      
              // ---------------------------------------------------------------
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text(
                        '아이디 (이메일) 찾기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: VerticalDivider(
                      thickness: 1,
                      width: 1,
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      
              // ---------------------------------------------------------------
      
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Divider(
                  thickness: 1,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} // End
