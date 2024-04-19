import 'package:flutter/material.dart';

class VMDiagnosisTest extends ChangeNotifier{
  int exerciseradioVlaue = 1;
  int smokerradioVlaue = 1;


  radioChange(value){
    exerciseradioVlaue = value;
    notifyListeners();
    
  }



  smokerRadioChange(smokerValue){
    smokerradioVlaue = smokerValue;
    notifyListeners();
  }
  



}