import 'package:flutter/material.dart';

class VMProviderHeightWeight extends ChangeNotifier{
  int _selectedHeight = 0;
  int _selectedWeight = 0;
  List<int> heightList = List.generate(71, (index) => index + 130);
  List<int> weightList = List.generate(71, (index) => index + 30);

  int get selectedHeight => _selectedHeight;
  int get selectedWeight => _selectedWeight;


  set selectedHeight(int value) {
    _selectedHeight = value;
    notifyListeners(); // 값 변경 시 구독자에게 알림
  }
  set selectedWeight(int value) {
    _selectedWeight = value;
    notifyListeners(); // 값 변경 시 구독자에게 알림
  }


}