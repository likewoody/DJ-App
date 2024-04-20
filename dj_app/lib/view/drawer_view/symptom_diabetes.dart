import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/component/diabetes_compo.dart';
import 'package:flutter/material.dart';

class SymptomDiabetes extends StatelessWidget {
  const SymptomDiabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarComponent(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              DiabetesCompo(titleName: '당뇨병 증상'),


              
              // 당뇨병 정의
              Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   모든 당뇨인이 반드시 당뇨병의 증상을 \n   경험하는 것은 아닙니다.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  '혈당이 180mg/dL 정도되면 소변에서 당이 나오게 됩니다. 그러나 이정도의 혈당수치 에서는 자각증상이 나타나지 않습니다. 혈당이 200~250mg/dL 이상을 초과할 경우  당과함께 수분의 배설이 많아지면서 갈증, 다음, 다식, 다뇨, 피로감, 체중감소 등을 느끼게 됩니다. 즉, 모든 당뇨인이 반드시 당뇨병의 증상을 경험하는 것은 아닙니다. 혈당관리를 잘 하면 자각증상도 없고 건강하게 지낼 수 있습니다.\n',
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),



              // 당뇨병의 대표 적인 증상
              Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Text(
                      '당뇨병의 대표 적인 증상',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   빈뇨 (소변을 자주 봄)',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   다음 (과도한 목마름)',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   다뇨 (소변량이 많음)',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   다식 (배고픔으로 많이 먹게 됨)',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   체중감소',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),



              // 기타 다른 증상
              Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Text(
                      '기타 다른 증상',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   피로감',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   눈이 뿌옇게 보임',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   다리에 통증',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   입이 마름',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   피부가 건조하고 가려움',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   발기부전(남성의 경우)',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   음부 가려움증(여성의 경우))',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   상처치유가 느려지거나 잘 안됨',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      '   감염성 질환에 걸리기 쉬움(감기, 요도감염 등)',
                      style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text(
                      '\n자료 출처 : 삼성서울병원 당뇨교육실\n\n',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}