import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VMProviderEnquire extends ChangeNotifier{

  String title = '';
  String context = '';
  // 선택 사진을 Xcode Path로 변환
	XFile? imageFile;
	// Gallery에서 사진 고르기 위함
	final picker = ImagePicker();
	// XFile type을 File Path로 변경 해주기 위함
	File? imgFile;
	// 선택 된 이미지
	File? selectedImg;
  bool checkNewImage = false;
  Random rand = Random();
  


  // ---- Function ----
  chooseFromGallery(imageSource) async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile == null) {
      print('get in if : null');
      imageFile = null;
      checkNewImage = false;
    }else{
      print('get in else : hasData');
      imageFile = XFile(pickedFile.path);
      selectedImg = File(imageFile!.path);
      checkNewImage = true;
      print(selectedImg);
    }
    notifyListeners();
  }

  _successfulAlert() {
    Get.defaultDialog(
      title: '알람',
      middleText: '문의하기가 완료 되었습니다.',
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



  // Date Format
  String _now() {
    final DateTime now = DateTime.now();
    return  ('${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${_weekdayToString(now.weekday)} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}');
	}

  _weekdayToString(weekday) {
    switch(weekday) {
      case 1 :
        return '월';
      case 2 :
        return '화';
      case 3 :
        return '수';
      case 4 :
        return '목';
      case 5 :
        return '금';
      case 6 :
        return '토';
      case 7 :
        return '일';
      default :
        return null;
    } 
  }




  // Insert
  Future<String> insertImage() async{
    final firebaseStorage = FirebaseStorage.instance
    .ref()
    .child('images') //storage name
    .child('${rand.nextInt(10000000)}.png'); // file name 아무렇게나 생성
    // image upload 
    await firebaseStorage.putFile(selectedImg!);
    // file path
    String downloadURL = await firebaseStorage.getDownloadURL();
    return downloadURL;

  }


  insertEnquire(userEmail) async{
    String image = await insertImage();
    await FirebaseFirestore.instance
          .collection('enquire')
          .add({
            'title' : title,
            'context' : context,
            'date' : _now(),
            'image' : image,
            'email' : userEmail,
          }).then((value) => {
            _successfulAlert(),
          });
  }
}