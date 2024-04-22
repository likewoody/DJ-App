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
                  showLabels: false,
                  showAxisLine: false,
                  showTicks: false,
                  minimum: 0,
                  maximum: 100,
                  startAngle: 180,
                  endAngle: 0,
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 33,
                        color: Color(0xFFFE2A25),
                        label: 'Slow',
                        sizeUnit: GaugeSizeUnit.factor,
                        labelStyle:
                            GaugeTextStyle(fontFamily: 'Times', fontSize: 20),
                        startWidth: 0.65,
                        endWidth: 0.65),
                    GaugeRange(
                      startValue: 33,
                      endValue: 66,
                      color: Color(0xFFFFBA00),
                      label: 'Moderate',
                      labelStyle:
                          GaugeTextStyle(fontFamily: 'Times', fontSize: 20),
                      startWidth: 0.65,
                      endWidth: 0.65,
                      sizeUnit: GaugeSizeUnit.factor,
                    ),
                    GaugeRange(
                      startValue: 66,
                      endValue: 99,
                      color: Color(0xFF00AB47),
                      label: 'Fast',
                      labelStyle:
                          GaugeTextStyle(fontFamily: 'Times', fontSize: 20),
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: 0.65,
                      endWidth: 0.65,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: dangjinRConnect.result*100,
                      enableAnimation: true,
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
