import 'package:dj_app/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Property
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();

  // ---------------------------------------------------------------------------

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: SizedBox(
                    width: 390,
                    child: TextField(
                      maxLength: 20,
                      controller: userIdController,
                      decoration: InputDecoration(
                        counterText: '', // 화면에 표시되는 maxLength 제거.
                        hintText: '아이디(이메일)',
                        hintFadeDuration: const Duration(milliseconds: 500),
                        suffixIcon: GestureDetector(
                          onTap: () => userIdController.clear(), // Field 초기화
                          child: Icon(
                            Icons.clear,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(20.0),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        //
                      },
                    ),
                  ),
                ),
          
                // ---------------------------------------------------------------
          
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 390,
                        child: TextField(
                          maxLength: 20,
                          controller: passwordController,
                          obscureText: true, // 비밀번호 마스킹 처리.
                          decoration: InputDecoration(
                            counterText: '', // 화면에 표시되는 maxLength 제거.
                            hintText: '비밀번호',
                            hintFadeDuration: const Duration(milliseconds: 500),
                            suffixIcon: GestureDetector(
                              onTap: () => passwordController.clear(), // Field 초기화
                              child: Icon(
                                Icons.clear,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(20.0),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value) {
                            //
                          },
                        ),
                      ),
                    ],
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
          
                IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Image.asset(
                    'images/naverButton.png',
                    fit: BoxFit.fill,
                    width: 200,
                    height: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Image.asset(
                    'images/googleButton.png',
                    fit: BoxFit.fill,
                    width: 200,
                    height: 50,
                  ),
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
                          () => const SignUpPage(),
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
                      child: SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 1,
                          width: 1,
                        ),
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
      ),
    );
  }
} // End
