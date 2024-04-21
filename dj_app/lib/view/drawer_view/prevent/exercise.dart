import 'package:dj_app/component/appbar.dart';
import 'package:flutter/material.dart';

class ExerciseDiabetes extends StatelessWidget {
  const ExerciseDiabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(titleName: '운동방법'),
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
                      '   왜 운동을 해야 하나요?',
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
                  '운동은 콜레스테롤을 낮추어 주고, 혈압을 개선시켜주며, 스트레스를 해소해 줍니다. 당뇨인의 경우 혈당관리에 도움을 줍니다. 당뇨교육자와 운동처방사의 상담을 통해 나에게 알맞은 운동 계획을 세워보세요. 내가 즐길 수 있는 운동을 선택하고 실현 가능한 목표를 세워 실천해보세요.\n'
                  '만약 별도의 운동시간을 가질 수 없다면, 업무 중에 최대한 많이 움직이거나 의자에 앉아서 운동을 하는 등 일상생활 중에 활동량을 늘릴 수 있는 최상의 방법을 생각해 봅니다',
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
              Image.asset(
                'images/img4.png',
                width: MediaQuery.of(context).size.width,
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   세가지 필수 운동',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),


              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text(
                      '유산소 운동',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Text(
                      '신체의 산소 소비량을 증가시키는 운동으로 속보,\n수영, 자전거타기 등과 같이 전신을 움직이는 운동을\n말합니다. 하루에 30분 이상, 주 5회 합니다.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text(
                      '스트레칭',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Text(
                      '근육을 늘림으로 해서 근육의 긴장을 완화시키고\n동작의 범위를 넓혀주는 것입니다. 운동전에 실시하는\n스트레칭은 운동시 상해를 예방해주고 운동후의 스트\n레칭은 피로회복에 도움을 줍니다',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text(
                      '근력 운동',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Row(
                  children: [
                    Text(
                      '근육의 양과 힘을 키워주어 혈당이 근육에서 에너지로\n소비가 잘될 수 있도록 도와줍니다. 아령(0.5~3kg)\n또는 밴드 운동을 주 3회 합니다',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
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
                child: Row(
                  children: [
                    Text(
                      "10분씩 하루에 세 번 운동 하는 것'은 '30분씩 하루에\n한 번 운동하는 것'과 마찬가지로 우리의 건강에 도움을\n줄 수 있습니다.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   잘못된 상식',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text(
                      '무조건 센 강도의 운동이 좋다? 이것은 거짓입니다.\n운동을 할 때는 ‘옆 사람과 대화를 할 수 있을 정도’의\n 강도가 알맞습니다. 만약 옆 사람과 대화도 하지 못할\n정도의 센 강도로 운동을 한다면 신체에 부담을 주어 오히려\n역효과를 초래할 수 있습니다',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
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
              const  Padding(
                padding: EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text(
                      "1. 식후 1시간에 운동이나 활동을 하고 전후의 혈당검사\n를 통해 혈당이 어떻게 반응하는지 확인해 보세요.\n"
                      "2. 공복혈당이 250mg/dL 이상으로 혈당이 너무 높거나\n 몸이 피곤할 때의 운동은 오히려 신체에 부담을\n 줄 수 있으므로 운동을 미루는 것이 좋습니다.\n",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
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