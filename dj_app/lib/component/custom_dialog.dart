import 'package:dj_app/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


  // ---------------------------------------------------------------------------

  static void buttonDialog(
    String title,
    String middleText,
    List<Widget> buttonList,
  ) {
    Get.defaultDialog(
      title: title,
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      middleText: middleText,
      middleTextStyle: const TextStyle(
        fontSize: 16,
      ),
      backgroundColor: Colors.yellow.shade200,
      barrierDismissible: false,
      actions: buttonList,
    );
  } // buttonDialog

  // ---------------------------------------------------------------------------

  static void signUpResultDialog(BuildContext context) {
    Get.defaultDialog(
      title: "축하합니다!",
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      middleText: "[DANG JN]\n"
          "회원가입이 완료되었습니다.\n"
          "이제 [DANG JN]의 모든 기능을\n"
          "이용하실 수 있습니다.\n"
          "지금 바로 로그인하세요 :)\n"
          "(아래 확인 버튼을 누르시면 로그인 페이지로\n"
          "이동합니다.)",
      middleTextStyle: const TextStyle(
        fontSize: 16,
      ),
      backgroundColor: const Color.fromARGB(255, 206, 234, 239),
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.offAll(
              () => const LoginView(),
              transition: Transition.fadeIn,
            );
          },
          child: const Text(
            'OK',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  } // si
