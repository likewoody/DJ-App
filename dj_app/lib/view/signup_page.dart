import 'package:dj_app/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // --- Property ----
  int currentStep = 0; // 현재 Step 위치

  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == steps().length - 1;

  final emailController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();

  bool _isPasswordVisible = false; // password 표시 여부

  // Clear Button 표시 여부
  bool _showEmailClearButton = false;
  bool _showPassword1ClearButton = false;
  bool _showPassword2ClearButton = false;
  bool _showNameClearButton = false;
  bool _showPhoneClearButton = false;
  bool _showBirthClearButton = false;

  String _selectedGender = "";

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateEmailClearButton);
    password1Controller.addListener(_updatePassword1ClearButton);
    password2Controller.addListener(_updatePassword2ClearButton);
    nameController.addListener(_updateNameClearButton);
    phoneController.addListener(_updatePhoneClearButton);
    birthController.addListener(_updateBirthClearButton);
  }

  @override
  void dispose() {
    emailController.removeListener(_updateEmailClearButton);
    password1Controller.removeListener(_updatePassword1ClearButton);
    password2Controller.removeListener(_updatePassword2ClearButton);
    nameController.removeListener(_updateNameClearButton);
    phoneController.removeListener(_updatePhoneClearButton);
    birthController.removeListener(_updateBirthClearButton);
    super.dispose();
  }

  void _updateEmailClearButton() {
    setState(() {
      _showEmailClearButton = emailController.text.isNotEmpty;
    });
  }

  void _updatePassword1ClearButton() {
    setState(() {
      _showPassword1ClearButton = password1Controller.text.isNotEmpty;
    });
  }

  void _updatePassword2ClearButton() {
    setState(() {
      _showPassword2ClearButton = password2Controller.text.isNotEmpty;
    });
  }

  void _updateNameClearButton() {
    setState(() {
      _showNameClearButton = nameController.text.isNotEmpty;
    });
  }

  void _updatePhoneClearButton() {
    setState(() {
      _showPhoneClearButton = phoneController.text.isNotEmpty;
    });
  }

  void _updateBirthClearButton() {
    setState(() {
      _showBirthClearButton = birthController.text.isNotEmpty;
    });
  }

  void _setSelectedGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  // ---------------------------------------------------------------------------

  // --- Widget Functions ----
  List<Step> steps() => [
        // 이메일 입력 단계
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(
            '이메일',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '이메일을 입력해 주세요 :)\n'
                  '회원 정보 조회 시 사용됩니다.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showEmailClearButton =
                              emailController.text.isNotEmpty;
                        });
                      },
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: '이메일을 입력해 주세요 :)',
                          hintFadeDuration: const Duration(milliseconds: 500),
                          suffixIcon: _showEmailClearButton
                              ? GestureDetector(
                                  onTap: () =>
                                      emailController.clear(), // Field 초기화
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey.shade400,
                                  ),
                                )
                              : null,
                          contentPadding: const EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ---------------------------------------------------------------------

        // 비밀번호 입력 단계
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text(
            '비밀번호',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '영문, 숫자, 특수문자 중 2종류 이상을 조합하여\n'
                  '최소 8자리 이상을 입력해 주시기를 바랍니다 :)',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword1ClearButton =
                              password1Controller.text.isNotEmpty;
                        });
                      },
                      child: TextFormField(
                        controller: password1Controller,
                        obscureText: !_isPasswordVisible, // 비밀번호 마스킹 처리.
                        decoration: InputDecoration(
                          hintText: '비밀번호를 입력해 주세요 :)',
                          hintFadeDuration: const Duration(milliseconds: 500),
                          suffixIcon: _showPassword1ClearButton
                              ? GestureDetector(
                                  onTap: () =>
                                      password1Controller.clear(), // Field 초기화
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey.shade400,
                                  ),
                                )
                              : null,
                          contentPadding: const EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
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
              SizedBox(
                width: 300,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPassword2ClearButton =
                          password2Controller.text.isNotEmpty;
                    });
                  },
                  child: TextFormField(
                    controller: password2Controller,
                    obscureText: !_isPasswordVisible, // 비밀번호 마스킹 처리.
                    decoration: InputDecoration(
                      hintText: '다시 한번 더 입력해 주세요 :)',
                      hintFadeDuration: const Duration(milliseconds: 500),
                      suffixIcon: _showPassword2ClearButton
                          ? GestureDetector(
                              onTap: () =>
                                  password2Controller.clear(), // Field 초기화
                              child: Icon(
                                Icons.clear,
                                color: Colors.grey.shade400,
                              ),
                            )
                          : null,
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ---------------------------------------------------------------------

        // 개인정보 입력 단계
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(
            '개인정보',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  '이름',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 300,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showNameClearButton = nameController.text.isNotEmpty;
                      });
                    },
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: '사용자 이름을 입력해 주세요 :)',
                        hintFadeDuration: const Duration(milliseconds: 500),
                        suffixIcon: _showNameClearButton
                            ? GestureDetector(
                                onTap: () =>
                                    nameController.clear(), // Field 초기화
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            : null,
                        contentPadding: const EdgeInsets.all(10.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ),

              // ---------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              '생년월일',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showBirthClearButton =
                                      birthController.text.isNotEmpty;
                                });
                              },
                              child: TextFormField(
                                controller: birthController,
                                decoration: InputDecoration(
                                  hintText: '생년월일 :)',
                                  hintFadeDuration:
                                      const Duration(milliseconds: 500),
                                  suffixIcon: _showBirthClearButton
                                      ? GestureDetector(
                                          onTap: () => birthController
                                              .clear(), // Field 초기화
                                          child: Icon(
                                            Icons.clear,
                                            color: Colors.grey.shade400,
                                          ),
                                        )
                                      : null,
                                  suffixIconColor: Colors.grey.shade400,
                                  contentPadding: const EdgeInsets.all(10.0),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            '성별',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                width: 60,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () => _setSelectedGender(
                                    "male",
                                  ),
                                  style: _selectedGender == "male"
                                      ? ElevatedButton.styleFrom(
                                          elevation: 8,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          foregroundColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                          padding: const EdgeInsets.all(5),
                                        )
                                      : ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(5),
                                        ),
                                  child: const Text(
                                    '남성',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () => _setSelectedGender(
                                  "female",
                                ),
                                style: _selectedGender == "female"
                                    ? ElevatedButton.styleFrom(
                                          elevation: 8,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          foregroundColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                          padding: const EdgeInsets.all(5),
                                        )
                                    : ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(5),
                                      ),
                                child: const Text(
                                  '여성',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // ---------------------------------------------------------------

              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  '휴대폰 번호',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 300,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPhoneClearButton = phoneController.text.isNotEmpty;
                      });
                    },
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: '휴대폰 번호를 입력해 주세요 :)',
                        hintFadeDuration: const Duration(milliseconds: 500),
                        suffixIcon: _showPhoneClearButton
                            ? GestureDetector(
                                onTap: () =>
                                    phoneController.clear(), // Field 초기화
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            : null,
                        contentPadding: const EdgeInsets.all(10.0),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ];

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 30),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 30,
                  ),
                  child: Stepper(
                    steps: steps(),
                    type: StepperType.vertical,
                    currentStep: currentStep,
                    onStepContinue: () {
                      if (isLastStep) {
                        Get.offAll(
                          () => LoginPage(),
                          transition: Transition.fadeIn,
                        );
                      } else {
                        setState(() => currentStep += 1);
                      }
                    },
                    onStepCancel: isFirstStep
                        ? null
                        : () => setState(
                              () => currentStep -= 1,
                            ),
                    onStepTapped: (step) => setState(
                      () => currentStep = step,
                    ),
                    controlsBuilder: (context, details) => Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Row(
                        children: [
                          if (!isFirstStep) ...[
                            Expanded(
                              child: ElevatedButton(
                                onPressed:
                                    isFirstStep ? null : details.onStepCancel,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF9F3E3),
                                  foregroundColor: const Color(0xFF0C0C0C),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                child: const Text(
                                  '이전',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          Expanded(
                            child: ElevatedButton(
                              onPressed: details.onStepContinue,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF9F3E3),
                                foregroundColor: const Color(0xFF0C0C0C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              child: Text(
                                isLastStep ? '완료' : '다음',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
} // End
