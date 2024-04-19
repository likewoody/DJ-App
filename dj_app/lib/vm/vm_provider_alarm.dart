import 'package:flutter/material.dart';

class VMProviderAlarm with ChangeNotifier{
  bool alarmSwitch = false;


  changedAlarm(value){
    alarmSwitch = value;
    notifyListeners();
  }

}