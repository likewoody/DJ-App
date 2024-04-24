import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/component/custom_dialog.dart';
import 'package:dj_app/component/custom_snackbar.dart';
import 'package:dj_app/view/login_signup/signup_view.dart';
import 'package:dj_app/vm/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // * Property
  final LoginViewModel _viewModel = Get.put(LoginViewModel());
  final box = GetStorage();

  bool _isPasswordVisible = false; // password 표시 여부

  // Clear Button 표시 여부
  bool _showEmailClearButton = false;
  bool _showPasswordClearButton = false;

  @override
  void initState() {
    super.initState();
    box.erase();
    _viewModel.emailController.text = 'fruit@hanmail.net';
    _viewModel.passwordController.text = 'bubble123@@';
    _viewModel.emailController.addListener(_updateEmailClearButton);
    _viewModel.passwordController.addListener(_updatePasswordClearButton);
  } // initState

  // * 텍스트 리스너, 스크롤 컨트롤러, 포커스 노드 등의 리소스 사용으로 인한 메모리 누수 방지!
  @override
  void dispose() {
    _viewModel.emailController.removeListener(_updateEmailClearButton);
    _viewModel.passwordController.removeListener(_updatePasswordClearButton);
    // _viewModel.emailController.dispose();
    // _viewModel.passwordController.dispose();
    super.dispose();
  } // dispose

  // *** Functions **** //

  void _updateEmailClearButton() {
    setState(() {
      _showEmailClearButton = _viewModel.emailController.text.isNotEmpty;
    });
  } // _updateEmailClearButton

  void _updatePasswordClearButton() {
    setState(() {
      _showPasswordClearButton = _viewModel.passwordController.text.isNotEmpty;
    });
  } // _updatePasswordClearButton

  void _checkIdPassword(context) {
    if (_viewModel.emailController.text.trim().isEmpty ||
        _viewModel.passwordController.text.trim().isEmpty) {
      CustomSnackbar.loginErrorSnackbar(context);
    } else {
      _viewModel.loginAction(context);
    }
  } // _checkIdPassword

  Future<void> _signInGoogle() async {
    List<String> scope = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly', //문제의 부분
    ];

    GoogleSignIn _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: 'your-client_id.apps.googleusercontent.com',
      scopes: scope,
    );
    try {
      await _googleSignIn.signIn();

      // 로그인 성공 후 사용자 정보 가져오기
      GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signInSilently();

      // 사용자 이메일 정보 출력
      if (googleSignInAccount != null) {
        _viewModel.googleSignInEmail = googleSignInAccount.email;
        print('Email1: ${googleSignInAccount.email}');
        print('Email2: ${_viewModel.googleSignInEmail}');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 335,
                            child: TextField(
                              controller: _viewModel.emailController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                hintText: "아이디(이메일)",
                                hintFadeDuration: const Duration(milliseconds: 500),
                                suffixIcon: _showEmailClearButton
                                    ? GestureDetector(
                                        onTap: () => _viewModel.emailController
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
                              textInputAction: TextInputAction.next,
                              enableSuggestions: true, // 자동제안 기능
                              autocorrect:
                                  true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                              // ***************************************************
                              // clear button 구현!
                              onChanged: (value) {
                                setState(() {
                                  _showEmailClearButton =
                                      _viewModel.emailController.text.isNotEmpty;
                                });
                              },
                            ),
                          ),
                        ],
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
                              controller: _viewModel.passwordController,
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
                                        onTap: () => _viewModel
                                            .passwordController
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
                                  _showPasswordClearButton = _viewModel
                                      .passwordController.text.isNotEmpty;
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
                        onPressed: () => _checkIdPassword(context),
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
                      onPressed: () => CustomDialog.buttonDialog(
                        "안내",
                        "추후 Update 예정이오니 양해바랍니다.",
                        [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              "확인",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      icon: Image.asset(
                        "images/naverButton.png",
                        fit: BoxFit.fill,
                        width: 200,
                        height: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await _signInGoogle().then(
                            (value) => _viewModel.googleSinginAction(context));
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
                            onPressed: () => CustomDialog.buttonDialog(
                              "안내",
                              "추후 Update 예정이오니 양해바랍니다.",
                              [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    "확인",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            onPressed: () => CustomDialog.buttonDialog(
                              "안내",
                              "추후 Update 예정이오니 양해바랍니다.",
                              [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    "확인",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
