import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  // * Property //
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // * Method //
  Future<void> loginAction(email, password) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
      print('null');
    }
  }
} // end of LoginViewModel class
