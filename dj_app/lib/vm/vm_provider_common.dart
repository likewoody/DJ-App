import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VMProviderCommon extends ChangeNotifier{

  // Get Storage 받기
  final box = GetStorage();
  String userEmail = '';
  // Common
  String whichOne = '';


  // =====================================
  // ===============Common================
  // Common component
  String getStorageUserEmail(){
    return userEmail = box.read('email');
  }
  

  // disposeStorage(){
  //   box.erase();
  // }

  InputDecoration textFormDecoration(hintText, helperText){
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      hintText: hintText,
      helperText: helperText,
      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
    );
  }


  showSuccessfulAlert() {
    Get.defaultDialog(
      barrierDismissible: false,
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

  showWarnSanckBar() {
    Get.snackbar(
      '경고', 
      '구글 로그인은 비밀번호를 수정할 수 없습니다.',
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white
    );
  }
  // =============Common==================
  // =====================================
  
  // ======================================
  // ================Email==============
  // Property
  String inputEmail = '';
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // // 6 자릿수 이상을 비밀번호로 설정
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  bool duplicatedCheck = false;
  bool duplicatedCheck2 = false;

  

  // Function
  duplicatedEmailFirst() async{
    print('check get in duplicated function');
    if(inputEmail.trim().isNotEmpty){
      print("not empty input email}");
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern.toString());
      if(!regExp.hasMatch(inputEmail)){
        return '잘못된 이메일 형식입니다.';
      }else{
        await duplicatedEmailSecond();
        if (duplicatedCheck2){
          await updateEmail();
          print('succesfully updated');
        }
      }
    }else {
      print('empty input email');
    }
  }

  duplicatedEmailSecond() async{
    final querySnapshot = await FirebaseFirestore.instance
    .collection('user')
    // .where('email', isNotEqualTo: inputEmail)
    // .where('email', isEqualTo: userEmail)
    .get();

    for(int i=0;i<querySnapshot.docs.length;i++) {
      print(querySnapshot.docs[i]['email']);

      if(inputEmail == querySnapshot.docs[i]['email']) {
        failedErrorSnack('중복된 이메일입니다.');
        duplicatedCheck2 = false;
        break;
      } else{
        duplicatedCheck2 = true;
      }
    }
  }

  updateEmail() async{
    await FirebaseFirestore.instance
    .collection('user')
    .doc(box.read('id'))
    // .where('email', isNotEqualTo: inputEmail)
    // .where('email', isEqualTo: userEmail)
    .update({
      'email': inputEmail
    });

  }

  // ================Email=================
  // ======================================


  // ======================================
  // ================Password==============
  // Property
  String currentPassword = '';
  String inputCurrentPassword = '';
  String fNewPassword = '';
  String sNewPassword = '';
  // 변경 완료 시 true or false
  bool _successfulChanged1 = false;
  bool _successfulChanged2 = false;

  bool get successfulChanged1 => _successfulChanged1;
  bool get successfulChanged2 => _successfulChanged2;


  // Function
  bool changePassword(){
    // 현재 비밀번호가 틀렸을 때 에러 스낵바
    print("1 $successfulChanged1}");
    print("2 $successfulChanged2}");
    if(successfulChanged1 && successfulChanged2){
      updatePassword();
      print("successfully, changed password to :$sNewPassword}");
      return true;
    }
    return false;
  }


  updatePassword() async{
    final querySnapshot = await FirebaseFirestore.instance
    .collection('user')
    .where('email', isEqualTo: userEmail)
    .get();

    print('test inside update passwor : $querySnapshot.docs');
    querySnapshot.docs.forEach((doc) {
      print(doc.data());
      doc.reference.update({
        'password': sNewPassword
      });
      print('check2');
    });
  }

  

  // ----- 현재 비밀번호 체크 ------
  curPasswordCheck() {
    print("현재 비밀번호는 $currentPassword");
    print("입력한 비밀번호는 $inputCurrentPassword");
    if (inputCurrentPassword.trim().isEmpty) {
      _successfulChanged1 = false;
    } else{
      if(currentPassword != inputCurrentPassword) {
        _successfulChanged1 = false;
        failedErrorSnack('현재 비밀번호를 정확히 입력하세요.');
      }else {
        _successfulChanged1 = true;
      }
    }

    Future.microtask(() {
      // 여기에서는 상태가 업데이트된 상황
      print("finished curPasswordCheck : $_successfulChanged1"); 
    });

  }

  
  // ----- 현재 비밀번호 체크 ------
  // ---------------------------



  // ----------------------------
  // ----- 새로운 비밀번호 체크 ------
  newPasswordCheck() {
    fNewPassword.trim().isEmpty || sNewPassword.trim().isEmpty
    ? failedErrorSnack('변경할 비밀번호를 정확히 입력하세요')
    : fNewPassword != sNewPassword 
      ? failedErrorSnack('변경할 비밀번호를 정확히 입력하세요')
      : _successfulChanged2 = true;
    
  }

  // 새로운 비밀번호들이 틀렸을 때 비밀번호 틀렸을 때 error SnackBar
  failedErrorSnack(txt) {
    Get.snackbar(
      '경고', 
      '$txt',
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


  // duplicatedEmailFirst() async{
  //   print('check get in duplicated function');
  //   if(inputEmail.isNotEmpty){
  //     print("not empty input email}");
  //     await updateEmail();
  //   }else {
  //     print('empty input email');
  //   }
  // }

  updateHeight() async{
    final querySnapshot = await FirebaseFirestore.instance
    .collection('user')
    .get();

    QueryDocumentSnapshot? targetDoc;

    for (var doc in querySnapshot.docs){
      if (doc.get('email') == userEmail) {
        targetDoc = doc;
        break;
        // duplicatedCheck2 = false;
        // failedErrorSnack('중복된 이메일입니다.');
      }
    }

    if (targetDoc != null) {
      // 문서 업데이트
      await targetDoc.reference.update({
        'height': _selectedHeight,
        'weight': _selectedWeight,
      });
      }else {
        print('해당 이메일의 문서를 찾을 수 없습니다.');
      }
  }
  // ==========Height/Wegght==============
  // =====================================
}