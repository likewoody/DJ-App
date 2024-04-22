import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/model/model_chart.dart';
import 'package:dj_app/model/model_dignosis_result.dart';
import 'package:dj_app/view/daignosis_page/diagnosis_result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DiagnosisView extends StatelessWidget {
  DiagnosisView({super.key});

  // Property
  String email = "1231@naver.com";
  String result = '';
  String initdate = '';
  List snapshotList = [];
  List<ChartModel> data = [];


  // Function
  String dateFormat(data) {
    // "2024-04-22 11:36:57.522965"
    return data.toString().substring(0, 10);
  }

  // View
  Widget _buildItemWidget(doc, context){
    dateFormat(doc['initdate']);
    final diagnosis = DiagnosisResult(result: doc['result'], initdate: dateFormat(doc['initdate']));

    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_forever),
      ),
      // ************* data 이동 시킬 때 doc ***************
      key: ValueKey(doc),
      onDismissed: (direction) {
        FirebaseFirestore.instance
        .collection('dangjin')
        .doc(doc.id)
        .delete();
      },
      // ************* data 이동 시킬 때 doc ***************
      child: GestureDetector(
        onTap: () {
          Get.to(const DiagnosisResultPage(), arguments: [
            // id는 자동으로 관리되는 Property
            doc['email'],
          ]);
        },
        child: SizedBox(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "당뇨병 검사 결과 : ${diagnosis.result}%\n날짜 : ${diagnosis.initdate}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
                  .collection('dangjin')
                  .orderBy('initdate', descending: false)
                  .snapshots(), 
          builder: (context, snapshot) {
            // 저장하면 데이터가 중복되는 것을 방지하기 위함
            snapshotList.clear();
            if(!snapshot.hasData){return const Center(child: CircularProgressIndicator(),);}
            
            // 조건을 넣기 위해 for문 돌리면서 조건 찾기
            snapshot.data!.docs.forEach((doc) {
              print(doc.get('email'));
              if(doc.get('email') == email) {
                snapshotList.add(doc.data());
                data.add(ChartModel(date: doc.get('initdate'), result: int.parse(doc.get('result'))));
              }
            });
            // 조건을 넣기 위해 for문 돌리면서 조건 찾기
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: SfCartesianChart(
                    title: const ChartTitle(
                      text: '나의 당뇨병 결과 차트'
                    ),
                    legend: const Legend(
                      isVisible: true
                    ),
                    series: [
                    // ColumnSeries : 세로 막대 그래프
                    // BarSeries : 가로 막대 그래프
                    // LineSeries : 선 그래프
                    // ScatterSeries : 산점도
                    // DeveloperData의 format이 2개라서 2개를 잡아줬는데 1나 밖에 사용하지 않을 때 '_'을 사용한다.
                    LineSeries<ChartModel, dynamic>(
                      color: Colors.red,
                      dataSource: data, // show data
                      xValueMapper: (ChartModel chartModel, _) => chartModel.date.toString().substring(0,10), // x 
                      yValueMapper: (ChartModel chartModel, _) => chartModel.result, // y
                      dataLabelSettings: const DataLabelSettings(isVisible: true), // y축 값 표시
                      enableTooltip: true, // default true
                      markerSettings: const MarkerSettings(
                      isVisible: true, // 데이터 포인트 표시 여부
                      height: 5, // 데이터 포인트 높이
                      width: 5, // 데이터 포인트 너비
                    ),

                    ),
                  ],
                  // x축을 category로 표현,
                  primaryXAxis: const CategoryAxis( // 카테고리화 시키면 밑에 x축 labels들이 다 나온다.
                    title: AxisTitle(text: '날짜'), // label
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(text: '당뇨병 확률 단위 : %'),
                    // minimum: 150000,
                  ),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: snapshotList.map((e) => _buildItemWidget(e, context)).toList(),)
              ],
            );
          },
        ),
      ),
    );
  }
}