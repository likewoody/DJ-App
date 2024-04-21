import 'package:dj_app/component/appbar.dart';
import 'package:flutter/material.dart';

class TabletDiabetes extends StatelessWidget {
  const TabletDiabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(titleName: '약물요법'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   올바른 약물요법 실천하기',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  "당뇨인에게 권해지는 약은 여러 가지가 있습니다. 혈당을 조절할 수 있는 인슐린과 경구혈당강하제, 합병증 예방을 위한 아스피린, 혈압약, 콜레스테롤약, 그리고 항우울제, 수면제도 처방 받을 수 있습니다. 각각의 약들은 각기 다른 효과를 나타냅니다. 그리고 언제, 어떻게 복용했는가에 의해서도 약효의 차이가 날 수 있습니다. 그러므로 최고의 효과를 위한 올바른 복용법을 알고 있어야 합니다. 또한 현재 복용중인 약의 이름, 용량, 약의 효과, 나에게 이 약이 처방되어진 이유를 반드시 알고 있어야 합니다.\n"
                  "새로운 약이나 치료를 시작할 때는 내 몸의 반응을 주의 깊게 관찰하세요. 그리고 약사, 의사, 당뇨교육자에게 이야기 하세요. 어떠한 부작용이 있었다면 반드시 의료진에게 알려야 합니다.",
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
              Image.asset(
                'images/img5.png',
                width: MediaQuery.of(context).size.width,
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   기억하세요',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  "- 의사에게 나에게 왜 이 약이 처방되었는지 물어보세요.\n"
                  "- 약사에게 이 약의 부작용이 무엇인지 물어보세요.\n"
                  "- 당뇨교육자에게 효과적인 복용 방법에 대해 물어보세요.\n",
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),


              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   알고 계셨나요?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  "어떤 건강보조식품이나 민간요법은 당신이 현재 사용하고 있는 약의 효과를 방해할 수도 있습니다. 당뇨전문가에게 현재 사용중인 보조식품이나 민간요법에 대해 상담해보세요.",
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),

              
              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   이것만은 꼭 지키세요',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  "1. 약 복용을 자주 잊어버린다면 하루 일과와 복약시간을 연관시켜 보세요. 예를 들면 아침에 이를 닦거나 저녁에 뉴스를      볼 때가 나의 복약시간이라고 정해보세요. 시계나 핸드폰의 알람을 이용하는 것도 좋은 방법입니다.\n"
                  "2. 처방 받은 약물에 대한 의료진의 설명을 노트에 메모해 보세요.\n"
                  "3. 약을 임의대로 늘려 먹거나 줄여 먹지 마십시오. 약 조정이 필요 하다고 여겨지면 먼저 의료진과 상담을 하시는 것이 바람직합니다\n",
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text(
                      '자료 출처 : 삼성서울병원 당뇨교육실\n\n',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}