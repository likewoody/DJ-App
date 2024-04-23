import 'package:dj_app/component/diagnosis_result_page_component.dart';
import 'package:dj_app/vm/vm_dangjin_r.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiagnosisResultPage extends StatelessWidget {
  DiagnosisResultPage({super.key});

  final DangjinRConnect dangjinRConnect = Get.put(DangjinRConnect());

  @override
  Widget build(BuildContext context) {
    return DiagnosisResultComponent(resultValue: dangjinRConnect.result);
  }
}
