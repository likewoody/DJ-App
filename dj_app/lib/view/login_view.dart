import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/component/custom_dialog.dart';
import 'package:dj_app/component/custom_snackbar.dart';
import 'package:dj_app/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // * Property
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false; // password 표시 여부

  // Clear Button 표시 여부
  bool _showEmailClearButton = false;
  bool _showPasswordClearButton = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateEmailClearButton);
    _passwordController.addListener(_updatePasswordClearButton);
  }

  // * 텍스트 리스너, 스크롤 컨트롤러, 포커스 노드 등의 리소스 사용으로 인한 메모리 누수 방지!
  @override
  void dispose() {
    _emailController.removeListener(_updateEmailClearButton);
    _passwordController.removeListener(_updatePasswordClearButton);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // *** Functions **** //

  void _updateEmailClearButton() {
    setState(() {
      _showEmailClearButton = _emailController.text.isNotEmpty;
    });
  }

  void _updatePasswordClearButton() {
    setState(() {
      _showPasswordClearButton = _passwordController.text.isNotEmpty;
    });
  }

  void _checkIdPassword() {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      CustomSnackbar.errorSnackbar(context);
    } else {
      if (_emailController.text.trim() == 'admin' &&
          _passwordController.text.trim() == 'qwer1234') {
          // CustomDialog.buttonDialog(
          //   [
          //     TextButton(
          //       onPressed: () {
          //         // TODO: 로그인 처리
          //       },
          //       child: const Text(
          //         '확인',
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ],
          // );
      } else {
        CustomSnackbar.warnSnackBar(context);
      }
    }
  }

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // 키보드와 컨텐츠 사이에 과도한 공간이 표시되는 경우를 예방하기 위함!
        appBar: const AppBarComponent(
          titleName: "",
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            // Keyboard Overflow 방지용 ListView
            child: ListView(
              shrinkWrap:
                  true, // 스크롤보기 범위가 보고있는 내용에 따라 결정되어야 하는지 여부 / true로 설정하면 목록이 콘텐츠를 래핑하고 자식이 허용하는 만큼 커진다.
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        bottom: 30,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: 390,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Colors.grey,
                            ),
                            hintText: "아이디(이메일)",
                            hintFadeDuration: const Duration(milliseconds: 500),
                            suffixIcon: _showEmailClearButton
                                ? GestureDetector(
                                    onTap: () =>
                                        _emailController.clear(), // Field 초기화
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.grey.shade400,
                                    ),
                                  )
                                : null,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(20.0),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          enableSuggestions: true, // 자동제안 기능
                          autocorrect:
                              true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                          // ***************************************************
                          // clear button 구현!
                          onChanged: (value) {
                            setState(() {
                              _showEmailClearButton =
                                  _emailController.text.isNotEmpty;
                            });
                          },
                        ),
                      ),
                    ),

                    // ---------------------------------------------------------

                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 335,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible, // 비밀번호 마스킹 처리.
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                hintText: "비밀번호",
                                hintFadeDuration:
                                    const Duration(milliseconds: 500),
                                suffixIcon: _showPasswordClearButton
                                    ? GestureDetector(
                                        onTap: () => _passwordController
                                            .clear(), // Field 초기화
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.grey.shade400,
                                        ),
                                      )
                                    : null,
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
                                // enter key를 눌렀을 경우 onSubmitted가 호출된다.
                              },
                              enableSuggestions: true, // 자동제안 기능
                              autocorrect:
                                  true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                              // ***********************************************
                              // clear button 구현!
                              onChanged: (value) {
                                setState(() {
                                  _showPasswordClearButton =
                                      _passwordController.text.isNotEmpty;
                                });
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: VerticalDivider(
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ---------------------------------------------------------

                    SizedBox(
                      width: 390,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () => _checkIdPassword(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: const Text(
                          "로그인 하기",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // ---------------------------------------------------------

                    const Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 5,
                      ),
                      child: Text(
                        "SNS계정으로 로그인하기",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // ---------------------------------------------------------

                    IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Image.asset(
                        "images/naverButton.png",
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
                        "images/googleButton.png",
                        fit: BoxFit.fill,
                        width: 200,
                        height: 50,
                      ),
                    ),

                    // ---------------------------------------------------------

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        bottom: 30,
                      ),
                      child: SizedBox(
                        width: 390,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(
                              () => const SignUpView(),
                              transition: Transition.zoom,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onTertiary,
                            foregroundColor:
                                Theme.of(context).colorScheme.tertiary,
                          ),
                          child: const Text(
                            "계정이 없으신가요? 간편가입하기",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ---------------------------------------------------------

                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                      ),
                    ),

                    // ---------------------------------------------------------

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
                              "아이디(이메일) 찾기",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
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
                              "비밀번호 찾기",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // ---------------------------------------------------------

                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} // end of class LoginView
