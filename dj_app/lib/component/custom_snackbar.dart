import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void customSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 2),
    );
  }

  // ---------------------------------------------------------------------------

  static void errorSnackbar(BuildContext context) {
    Get.snackbar(
      "경고",
      "사용자 ID(이메일)와 Password를 입력해주시기 바랍니다.",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.error,
      colorText: Theme.of(context).colorScheme.onError,
      borderRadius: 20,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
    );
  }

  // ---------------------------------------------------------------------------

  static void warnSnackBar(BuildContext context) {
    Get.snackbar(
      "경고",
      "사용자 ID(이메일)나 Password가 일치하지 않습니다."
          "\n다시 입력해주시기 바랍니다.",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.error,
      colorText: Theme.of(context).colorScheme.onError,
      borderRadius: 20,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
    );
  }
} // end of CustomSnackbar
