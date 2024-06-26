import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/component/custom_dialog.dart';
import 'package:dj_app/vm/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  // * Property //
  final SignUpViewModel _viewModel = Get.put(SignUpViewModel());

  int currentStep = 0; // 현재 Step 위치

  bool get isFirstStep => currentStep == 0; // 첫 번째 Step
  bool get isLastStep => currentStep == steps().length - 1; // 마지막 Step

  bool _isPasswordVisible = false; // password 표시 여부

  // Clear Button 표시 여부
  bool _showEmailClearButton = false;
  bool _showPassword1ClearButton = false;
  bool _showPassword2ClearButton = false;
  bool _showNameClearButton = false;
  bool _showPhoneClearButton = false;

  DateTime? _selectedDay; // 선택한 생년월일

  // 정규식
  final _emailRegExp = RegExp(r'^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,4}$');
  final _minMaxLength = RegExp(r'[a-zA-Z\d$@$!%*#?&]{8,100}');
  final _hasAlphabets = RegExp(r'(?=.*[a-zA-Z])');
  final _hasDigit = RegExp(r'(?=.*\d)');
  final _hasSpecialChar = RegExp(r'(?=.*[$@$!%*#?&])');
  final _noConsecutiveCharsDigits =
      RegExp(r'^(?!.*(.)\1{2,})(?!.*(\d)\2{2,}).*$');
  final _nameRegExp = RegExp(r'^[가-힣]{2,4}$');
  final _phoneRegExp = RegExp(r'(^\d{3})-\d{3,4}-\d{4}$');

  // * GlobalKey 는 위젯트리내에서 전역적으로 고유한 키를 생성해주고 GlobalKey<FormState>()는 폼 위젯의 키를 준다.
  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ]; // 폼의 상태를 확인 -> const 제거

  @override
  void initState() {
    super.initState();
    _viewModel.emailController.addListener(_updateEmailClearButton);
    _viewModel.password1Controller.addListener(_updatePassword1ClearButton);
    _viewModel.password2Controller.addListener(_updatePassword2ClearButton);
    _viewModel.nameController.addListener(_updateNameClearButton);
    _viewModel.phoneController.addListener(_updatePhoneClearButton);
  } // initState

  // * 텍스트 리스너, 스크롤 컨트롤러, 포커스 노드 등의 리소스 사용으로 인한 메모리 누수 방지!
  @override
  void dispose() {
    _viewModel.emailController.removeListener(_updateEmailClearButton);
    _viewModel.password1Controller.removeListener(_updatePassword1ClearButton);
    _viewModel.password2Controller.removeListener(_updatePassword2ClearButton);
    _viewModel.nameController.removeListener(_updateNameClearButton);
    _viewModel.phoneController.removeListener(_updatePhoneClearButton);
    _viewModel.emailController.dispose();
    _viewModel.password1Controller.dispose();
    _viewModel.password2Controller.dispose();
    _viewModel.nameController.dispose();
    _viewModel.birthdayController.dispose();
    _viewModel.phoneController.dispose();
    super.dispose();
  } // dispose

  // ---------------------------------------------------------------------------

  // *** Functions **** //
  void _updateEmailClearButton() {
    setState(() {
      _showEmailClearButton = _viewModel.emailController.text.isNotEmpty;
    });
  } // _updateEmailClearButton

  void _updatePassword1ClearButton() {
    setState(() {
      _showPassword1ClearButton =
          _viewModel.password1Controller.text.isNotEmpty;
    });
  } // _updatePassword1ClearButton

  void _updatePassword2ClearButton() {
    setState(() {
      _showPassword2ClearButton =
          _viewModel.password2Controller.text.isNotEmpty;
    });
  } // _updatePassword2ClearButton

  void _updateNameClearButton() {
    setState(() {
      _showNameClearButton = _viewModel.nameController.text.isNotEmpty;
    });
  } // _updateNameClearButton

  void _updatePhoneClearButton() {
    setState(() {
      _showPhoneClearButton = _viewModel.phoneController.text.isNotEmpty;
    });
  } // _updatePhoneClearButton

  void _setSelectedGender(String gender) {
    setState(() {
      _viewModel.gender = gender;
    });
  } // _setSelectedGender

  // ---------------------------------------------------------------------------

  // *** Widget Functions **** //
  List<Step> steps() => [
        // * E-mail 입력 단계
        Step(
          state: currentStep > 0
              ? StepState.complete
              : StepState
                  .indexed, // StepState - 5가지의 상태 / complete - Check Icon으로 변경 / indexed - 현재 index 값을 숫자 아이콘으로 표시
          isActive: currentStep >= 0,
          title: const Text(
            "E-mail",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          content: Form(
            key: _formKeys[0],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-mail을 입력해 주세요 :)\n"
                        "회원 정보 조회 시 사용됩니다.",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "@ 앞 부분은 영문, 숫자만 사용할 수 있습니다.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _viewModel.emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail을 입력해 주세요 :)",
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
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 2.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    enableSuggestions: true, // 자동제안 기능
                    autocorrect:
                        true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                    // *********************************************************
                    // Email 유효성 검사(정규식 패턴)
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "E-mail은 반드시 입력 해야 합니다!";
                      }
                      if (!_emailRegExp.hasMatch(value)) {
                        return '유효한 E-mail을 입력해 주세요!';
                      }
                      return null;
                    },
                    // *********************************************************
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
        ),

        // ---------------------------------------------------------------------

        // * 비밀번호 입력 단계
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text(
            "비밀번호",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          content: Form(
            key: _formKeys[1],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "비밀번호는 다음의 기준을 만족해야 합니다 :)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Text(
                        "- 최소 8자리 이상\n"
                        "- 최소 1개 이상의 영문자(대,소문자 구분 X) 포함!\n"
                        "- 최소 1개 이상의 숫자 포함!\n"
                        "- 최소 1개 이상의 특수문자 포함!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 270,
                      child: TextFormField(
                        controller: _viewModel.password1Controller,
                        obscureText: !_isPasswordVisible, // 비밀번호 마스킹 처리.
                        decoration: InputDecoration(
                          hintText: "비밀번호를 입력해 주세요 :)",
                          hintFadeDuration: const Duration(milliseconds: 500),
                          suffixIcon: _showPassword1ClearButton
                              ? GestureDetector(
                                  onTap: () => _viewModel.password1Controller
                                      .clear(), // Field 초기화
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey.shade400,
                                  ),
                                )
                              : null,
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error,
                              width: 2.0,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        enableSuggestions: true, // 자동제안 기능
                        autocorrect:
                            true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                        // *****************************************************
                        // Password 유효성 검사(정규식 패턴)
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "비밀번호는 반드시 입력 해야 합니다!";
                          }
                          if (!_minMaxLength.hasMatch(value)) {
                            return "8자 이상 100자 이하로 입력해주세요!";
                          }
                          if (!_hasAlphabets.hasMatch(value)) {
                            return "영문자 1개 이상 입력해주세요!";
                          }
                          if (!_hasDigit.hasMatch(value)) {
                            return "숫자 1개 이상 입력해주세요!";
                          }
                          if (!_hasSpecialChar.hasMatch(value)) {
                            return "특수문자 1개 이상 입력해주세요!";
                          }
                          if (!_noConsecutiveCharsDigits.hasMatch(value)) {
                            return "연속된 동일한 문자 및 숫자 3자리 이상 금지!";
                          }
                          return null;
                        },
                        // *****************************************************
                        // clear button 구현!
                        onChanged: (value) {
                          setState(() {
                            _showPassword1ClearButton =
                                _viewModel.password1Controller.text.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 3,
                        right: 3,
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
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _viewModel.password2Controller,
                    obscureText: !_isPasswordVisible, // 비밀번호 마스킹 처리.
                    decoration: InputDecoration(
                      hintText: "다시 한번 더 입력해 주세요 :)",
                      hintFadeDuration: const Duration(milliseconds: 500),
                      suffixIcon: _showPassword2ClearButton
                          ? GestureDetector(
                              onTap: () => _viewModel.password2Controller
                                  .clear(), // Field 초기화
                              child: Icon(
                                Icons.clear,
                                color: Colors.grey.shade400,
                              ),
                            )
                          : null,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 2.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    enableSuggestions: true, // 자동제안 기능
                    autocorrect:
                        true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                    // *********************************************************
                    // Password 유효성 검사(정규식 패턴)
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "비밀번호는 반드시 입력 해야 합니다!";
                      }
                      if (_viewModel.password1Controller.text.trim() !=
                          _viewModel.password2Controller.text.trim()) {
                        return "비밀번호가 일치하지 않습니다!";
                      }
                      return null;
                    },
                    // *********************************************************
                    // clear button 구현!
                    onChanged: (value) {
                      setState(() {
                        _showPassword2ClearButton =
                            _viewModel.password2Controller.text.isNotEmpty;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // ---------------------------------------------------------------------

        // * 개인정보 입력 단계
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(
            "개인정보",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          content: Form(
            key: _formKeys[2],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "이름",
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
                    child: TextFormField(
                      controller: _viewModel.nameController,
                      decoration: InputDecoration(
                        hintText: "사용자 이름을 입력해 주세요 :)",
                        hintFadeDuration: const Duration(milliseconds: 500),
                        suffixIcon: _showNameClearButton
                            ? GestureDetector(
                                onTap: () => _viewModel.nameController
                                    .clear(), // Field 초기화
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            : null,
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10.0),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      enableSuggestions: true, // 자동제안 기능
                      autocorrect:
                          true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                      // *******************************************************
                      // Name 유효성 검사(정규식 패턴)
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "이름은 반드시 입력 해야 합니다!";
                        }
                        if (!_nameRegExp.hasMatch(value)) {
                          return '유효한 이름을 입력해주세요!';
                        }
                        return null;
                      },
                      // *******************************************************
                      // clear button 구현!
                      onChanged: (value) {
                        setState(() {
                          _showNameClearButton =
                              _viewModel.nameController.text.isNotEmpty;
                        });
                      },
                    ),
                  ),
                ),

                // *************************************************************

                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "생년월일",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              child: TextFormField(
                                controller: _viewModel.birthdayController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: "선택하기 :)",
                                  hintFadeDuration:
                                      const Duration(milliseconds: 500),
                                  suffixIcon: GestureDetector(
                                    onTap: () =>
                                        CustomDialog.showCalendarDialog(
                                      context,
                                      _viewModel.birthdayController,
                                      _selectedDay,
                                    ),
                                    child: const Icon(
                                      Icons.calendar_today,
                                    ),
                                  ),
                                  suffixIconColor: Colors.grey.shade400,
                                  contentPadding: const EdgeInsets.all(10.0),
                                ),
                                // *********************************************
                                // 생년월일 유효성 검사
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "생년월일 선택!";
                                  }
                                  return null;
                                },
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
                              "성별",
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
                                    style: _viewModel.gender == "male"
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
                                      "남성",
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
                                  style: _viewModel.gender == "female"
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
                                    "여성",
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

                // *************************************************************

                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "휴대폰 번호",
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
                    child: TextFormField(
                      controller: _viewModel.phoneController,
                      decoration: InputDecoration(
                        hintText: "휴대폰 번호를 입력해 주세요 :)",
                        hintFadeDuration: const Duration(milliseconds: 500),
                        suffixIcon: _showPhoneClearButton
                            ? GestureDetector(
                                onTap: () => _viewModel.phoneController
                                    .clear(), // Field 초기화
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            : null,
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10.0),
                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      enableSuggestions: true, // 자동제안 기능
                      autocorrect:
                          true, // 사용자가 텍스트를 입력할 때 오타나 잘못된 단어를 자동으로 수정하는 기능
                      inputFormatters: [
                        MultiMaskedTextInputFormatter(
                          masks: [
                            'xxx-xxx-xxxx',
                            'xxx-xxxx-xxxx',
                          ],
                          separator: '-',
                        ),
                      ],
                      // *******************************************************
                      // Phone 유효성 검사(정규식 패턴)
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "휴대폰 번호는 반드시 입력 해야 합니다!";
                        }
                        if (!_phoneRegExp.hasMatch(value)) {
                          return '유효한 휴대폰 번호를 입력해주세요!';
                        }
                        return null;
                      },
                      // *******************************************************
                      // clear button 구현!
                      onChanged: (value) {
                        setState(() {
                          _showPhoneClearButton =
                              _viewModel.phoneController.text.isNotEmpty;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ];

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset:
              false, // 키보드와 컨텐츠 사이에 과도한 공간이 표시되는 경우를 예방하기 위함!
          appBar: const AppBarComponent(
            titleName: "",
          ),
          // Keyboard Overflow 방지용 ListView
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: ListView(
              shrinkWrap:
                  true, // 스크롤보기 범위가 보고있는 내용에 따라 결정되어야 하는지 여부 / true로 설정하면 목록이 콘텐츠를 래핑하고 자식이 허용하는 만큼 커진다.
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 40,
                        bottom: 30,
                      ),
                      child: Text(
                        "회원가입",
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
                        steps: steps(), // 화면에 보여줄 Step List
                        type: StepperType
                            .vertical, // Step 을 수직으로 보여줄 것인지, 수평으로 보여줄 것인지 설정!
                        currentStep: currentStep, // 현재 표시되는 Step의 index 값
                        // *****************************************************
                        // 다음 버튼을 탭 했을 때, 동작할 로직을 구현!
                        onStepContinue: () {
                          if (_formKeys[currentStep].currentState!.validate()) {
                            // 마지막 단계인 경우 회원가입 완료 로직 실행
                            if (isLastStep) {
                              _viewModel.signUpAction();
                              CustomDialog.signUpResultDialog(context);
                            } else {
                              setState(() => currentStep += 1);
                            }
                          }
                        },
                        // *****************************************************
                        // 취소 버튼을 탭 했을 때, 동작할 로직을 구현!
                        onStepCancel: isFirstStep
                            ? null
                            : () => setState(
                                  () => currentStep -= 1,
                                ),
                        // *****************************************************
                        // 스텝들을 탭 했을 때, 동작할 로직을 구현!
                        onStepTapped: (step) {
                          if (_formKeys[step].currentState!.validate()) {
                            setState(
                              () => currentStep = step,
                            );
                          }
                        },
                        // *****************************************************
                        // 각 Step별 Button 구현!
                        controlsBuilder: (context, details) => Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Row(
                            children: [
                              if (!isFirstStep) ...[
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: isFirstStep
                                        ? null
                                        : details.onStepCancel,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF9F3E3),
                                      foregroundColor: const Color(0xFF0C0C0C),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    child: const Text(
                                      "이전",
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
                                    isLastStep ? "완료" : "다음",
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
              ],
            ),
          ),
        ),
      );
} // end of class SignUpView
