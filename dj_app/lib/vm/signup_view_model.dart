import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
  // * Property //
  final emailController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();
  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  final phoneController = TextEditingController();

  String gender = "";

  // * Method //
  Future<void> signUpAction() async {
    final DateTime now = DateTime.now();
    String dateofjoin = ("${now.year.toString()}"
        "-${now.month.toString().padLeft(2, "0")}"
        "-${now.day.toString().padLeft(2, '0')}");

    await FirebaseFirestore.instance.collection("user").add(
      {
        "email": emailController.text.trim().toString(),
        "password": password1Controller.text.trim().toString(),
        "name": nameController.text.trim().toString(),
        "birthday": birthdayController.text.trim().toString(),
        "gender": gender,
        "phone": phoneController.text.trim().toString(),
        "weight": 0,
        "height": 0,
        "dateofjoin": dateofjoin,
      },
    );
  } // end of signUpAction method
} // end of SignUpViewModel class
