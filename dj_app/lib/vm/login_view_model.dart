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
  String googleSignInEmail = '';
  final box = GetStorage();

  // * Method //
  Future<void> loginAction(context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: emailController.text.trim().toString())
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      if (querySnapshot.docs[0]["email"].toString() ==
              emailController.text.trim().toString() &&
          querySnapshot.docs[0]["password"].toString() ==
              passwordController.text.trim().toString()) {
        CustomDialog.buttonDialog(
          "환영합니다.",
          "신분이 확인되었습니다.",
          [
            TextButton(
              onPressed: () {
                saveStorage(
                    querySnapshot, emailController.text.trim().toString());
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
        CustomSnackbar.loginWarnSnackBar(context);
      }
    } else {
      CustomSnackbar.loginWarnSnackBar(context);
    }
  } // end of loginAction method

  Future<void> googleSinginAction(context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: googleSignInEmail.trim().toString())
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      CustomDialog.buttonDialog(
        "환영합니다.",
        "신분이 확인되었습니다.",
        [
          TextButton(
            onPressed: () {
              box.write('apiUser', true);
              saveStorage(querySnapshot, googleSignInEmail.trim().toString());
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
      CustomSnackbar.loginWarnSnackBar(context);
    }
  } // end of loginAction method

  void saveStorage(QuerySnapshot querySnapshot, saveEmail) {
    box.write("email", saveEmail);
    box.write("id", querySnapshot.docs[0].id.toString());
    box.write("name", querySnapshot.docs[0]['name'].toString());
  } // end of saveStorage method
} // end of LoginViewModel class
