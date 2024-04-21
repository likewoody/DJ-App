import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VMProviderCommon extends ChangeNotifier{
  
  // ======================================
  // ================Email==============
  // Property
  String email = '';
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // // 6 자릿수 이상을 비밀번호로 설정
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  // Common
  String whichOne = '';

  // ================Email=================
  // ======================================


  // ======================================
  // ================Password==============
  // Property
  String currentPassword = '';
  String inputCurrentPassword = '';
  String _currentErrorMsg = '';
  String fNewPassword = '';
  String sNewPassword = '';
  // 변경 완료 시 true or false
  bool _successfulChanged1 = false;
  bool _successfulChanged2 = false;

  String get currentErrorMsg => _currentErrorMsg;
  bool get successfulChanged1 => _successfulChanged1;
  bool get successfulChanged2 => _successfulChanged2;


  // Method
  updateEmail() async{
    final querySnapshot = await FirebaseFirestore.instance
    .collection('user')
    .get();

    QueryDocumentSnapshot? targetDoc;

    for (var doc in querySnapshot.docs){
      if (doc.get('email') == email) {
        targetDoc = doc;
        break;
      }
    }

    if (targetDoc != null) {
    // 문서 업데이트
    await targetDoc.reference.update({
      'password': sNewPassword
    });
    } else {
      print('해당 이메일의 문서를 찾을 수 없습니다.');
    }
  }


  // ----- 현재 비밀번호 체크 ------
  curPasswordCheck() {
    print("현재 비밀번호는 $currentPassword");
    print("입력한 비밀번호는 $inputCurrentPassword");
    if (inputCurrentPassword.isEmpty) {
      _currentErrorMsg = '비밀번호를 입력해 주세요.';
    } else{
      if(currentPassword != inputCurrentPassword) {
        _currentErrorMsg = '비밀번호를 확인해 주세요.';
      }else {
        _currentErrorMsg = '';
        _successfulChanged1 = true;
      }
    }
    notifyListeners();

    Future.microtask(() {
      // 여기에서는 상태가 업데이트된 상황
      print(currentErrorMsg + " finished line"); 
    });

  }

  
  // ----- 현재 비밀번호 체크 ------
  // ---------------------------



  // ----------------------------
  // ----- 새로운 비밀번호 체크 ------
  newPasswordCheck() {
    fNewPassword.isEmpty || sNewPassword.isEmpty
    ? failedErrorSnack()
    : fNewPassword != sNewPassword 
      ? failedErrorSnack()
      : _successfulChanged2 = true;
    
  }

  // 새로운 비밀번호들이 틀렸을 때 비밀번호 틀렸을 때 error SnackBar
  failedErrorSnack() {
    Get.snackbar(
      '경고', 
      '변경할 비밀번호를 정확히 입력하세요',
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white
    );
  }
  // ----- 새로운 비밀번호 체크 ------
  // ----------------------------
  // ===============Password==============
  // =====================================

  

  // =====================================
  // ==========Height/Wegght==============
  int _selectedHeight = 0;
  int _selectedWeight = 0;
  List<int> heightList = List.generate(71, (index) => index + 130);
  List<int> weightList = List.generate(71, (index) => index + 30);

  int get selectedHeight => _selectedHeight;
  int get selectedWeight => _selectedWeight;


  set selectedHeight(int value) {
    _selectedHeight = value;
    notifyListeners(); // 값 변경 시 구독자에게 알림
  }
  set selectedWeight(int value) {
    _selectedWeight = value;
    notifyListeners(); // 값 변경 시 구독자에게 알림
  }
  // ==========Height/Wegght==============
  // =====================================


  
  // =====================================
  // ===============Common================
  // Common component
  InputDecoration textFormDecoration(hintText, helperText){
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      hintText: hintText,
      helperText: helperText,
      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
    );
  }

  Widget showOkBtn(buttonText){
    return ElevatedButton(
      child: Text(buttonText),
      onPressed: (){
        formKey.currentState!.validate();
        // await _emailCheck();
    //         // provider.email = textCon.text;
    //         // FirebaseFirestore.instance
    //         //     .collection('user')
    //         //     .doc(id)
    //         //     .update({'email': provider.email});
    //         // print(provider.email);
      },
    );
  }

  showSuccessfulAlert() {
    Get.defaultDialog(
      title: '변경 완료',
      middleText: '$whichOne 변경이 완료 되었습니다.',
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          }, 
          child: const Text('종료')
        ),
      ]
    );
  }
  // =============Common==================
  // =====================================


  // Future<void> signInEmailChange(userEmail) async {
  //   User? _user = _firebaseAuth.currentUser;
  //   if (_user != null) {
  //     print('get in ');
  //     await _user.verifyBeforeUpdateEmail(userEmail).then((_) {
  //       print('successful');
  //     });
  //   }
  // }
}