import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VMPRoviderPassword extends ChangeNotifier{
  String currentPassword = '';
  String inputCurrentPassword = '';
  String _currentErrorMsg = '';
  String fNewPassword = '';
  String sNewPassword = '';
  // 변경 완료 시 true or false
  bool _successfulChanged = false;

  String get currentErrorMsg => _currentErrorMsg;
  bool get successfulChanged => _successfulChanged;

  // ---------------------------
  // ----- 현재 비밀번호 체크 ------
  curPasswordCheck() {
    if (inputCurrentPassword.isEmpty) {
      _currentErrorMsg = '비밀번호를 입력해 주세요.';
    } else{
      if(currentPassword != inputCurrentPassword) {
        _currentErrorMsg = '비밀번호를 확인해 주세요.';
      }else {
        _currentErrorMsg = '';
        _successfulChanged = true;
      }
    }
    notifyListeners();

    Future.microtask(() {
      // 여기에서는 상태가 업데이트된 상황
      print(currentErrorMsg); 
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
      : _successfulChanged = true;
    
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
}