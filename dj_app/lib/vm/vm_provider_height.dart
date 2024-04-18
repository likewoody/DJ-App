import 'package:flutter/material.dart';

class VMProviderHeightWeight extends ChangeNotifier{
  int selectedHeight = 0;
  int selectedWeight = 0;
  List<int> heightList = List.generate(71, (index) => index + 130);
  List<int> weightList = List.generate(71, (index) => index + 30);


}