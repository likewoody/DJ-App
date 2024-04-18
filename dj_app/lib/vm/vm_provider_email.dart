import 'package:flutter/cupertino.dart';

class VMProviderEmail extends ChangeNotifier{
  String _email = '';

  String get email => _email;


  set email(changeEmail){
    _email = changeEmail;
    notifyListeners();
  }
}