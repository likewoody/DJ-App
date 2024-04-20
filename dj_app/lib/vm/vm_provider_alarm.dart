import 'package:flutter/material.dart';

class VMProviderAlarm extends ChangeNotifier{
  bool alarmSwitch = false;


  changedAlarm(value){
    alarmSwitch = value;
    notifyListeners();
  }

}