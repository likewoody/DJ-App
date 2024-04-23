import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/custom_dialog.dart';
import 'package:dj_app/component/custom_snackbar.dart';
import 'package:dj_app/view/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginViewModel extends GetxController {
  // * Property //
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage();

  // * Method //
  Future<void> loginAction(context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: emailController.text.trim().toString())
        .get();
    QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
        .collection("user")
        .where("password", isEqualTo: passwordController.text.trim().toString())
        .get();

    if (querySnapshot.docs.isNotEmpty && querySnapshot2.docs.isNotEmpty) {
      CustomDialog.buttonDialog(
        "환영합니다.",
        "신분이 확인되었습니다.",
        [
          TextButton(
            onPressed: () {
              saveStorage(querySnapshot);
              Get.offAll(
                () => const Tabbar(),
              );
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
      );
    } else {
      CustomSnackbar.warnSnackBar(context);
    }
  } // end of loginAction method

  void saveStorage(QuerySnapshot querySnapshot) {
    box.write("email", emailController.text.trim().toString());
    box.write("name", querySnapshot.docs[0]['name'].toString());
  } // end of saveStorage method
} // end of LoginViewModel class
