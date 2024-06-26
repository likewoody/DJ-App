import 'package:flutter/material.dart';

class VMDiagnosisTest extends ChangeNotifier {
  int consentradioValue = 1;
  int alcoholradioVlaue = 1;
  int fruitradioVlaue = 1;
  int genhlthradioValue = 1;
  int heartradioValue = 1;
  int highBpradioValue = 1;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  // 동의
  consentRadioChange(consentValue) {
    consentradioValue = consentValue;
    notifyListeners();
  }

  // 알콜
  alcoholradioChange(alcoholvalue) {
    alcoholradioVlaue = alcoholvalue;
    notifyListeners();
  }

  // 과일
  fruitRadioChange(fruitValue) {
    fruitradioVlaue = fruitValue;
    notifyListeners();
  }

  // 건강 상태
  genHlthRadioChange(genHlthValue) {
    genhlthradioValue = genHlthValue;
    notifyListeners();
  }

  //심장질환
  heartRadioChange(heartValue) {
    heartradioValue = heartValue;
    notifyListeners();
  }

  //고혈압 여부
  highBpRadioChange(highBpValue) {
    highBpradioValue = highBpValue;
    notifyListeners();
  }

  // 페이지 보여주기
  setCurrentPage() {
    _currentPage = _currentPage;
    notifyListeners();
  }

  PageController get pageController => _pageController;
}

