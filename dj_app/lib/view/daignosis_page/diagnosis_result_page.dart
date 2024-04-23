import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/tabbar.dart';
import 'package:dj_app/vm/vm_dangjin_r.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DiagnosisResultPage extends StatefulWidget {
  const DiagnosisResultPage({super.key});

  @override
  State<DiagnosisResultPage> createState() => _DiagnosisResultPageState();
}

class _DiagnosisResultPageState extends State<DiagnosisResultPage> {
  final DangjinRConnect dangjinRConnect = Get.put(DangjinRConnect());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(titleName: ""),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '당신의 당뇨병 확률은 ${dangjinRConnect.result.toString().substring(2, 4)}% 입니다.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  startAngle: 180,
                  endAngle: 0,
                  minimum: 0,
                  maximum: 100.1,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.25,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      enableAnimation: true,
                      value: dangjinRConnect.result*100,
                      width: 0.25,
                      sizeUnit: GaugeSizeUnit.factor,
                      gradient: const SweepGradient(
                        colors: <Color>[Color(0xFFCC2B5E), Color(0xFF753A88)],
                        stops: <double>[0.25, 0.75],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(const Tabbar());
                },
                child: const Text('처음으로')),
          ],
        ),
      ),
    );
  }
}
