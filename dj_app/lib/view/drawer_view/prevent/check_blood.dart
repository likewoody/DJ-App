import 'package:dj_app/component/appbar.dart';
import 'package:flutter/material.dart';

class BloodCheck extends StatelessWidget {
  const BloodCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(titleName: '자가혈당측정법'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Container(
              //   color: Theme.of(context).colorScheme.primaryContainer,
              //   width: MediaQuery.of(context).size.width,
              //   child: const Text(
              //     '자가혈당측정법',
              //     style: TextStyle(
              //       fontSize: 23,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),



              // 왜 측정해야 하는가?????
              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   왜 자가 혈당측정을 해야 하나요?',
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
                  '당뇨병성 합병증을 예방하기 위해 가장 중요한 것은 혈당을 목표 수치 내로 조절하는 것입니다. 그러나 혈당은 24시간 변하며, 느낌이나 기분만으로는정확한 수치를 알 수 없습니다. 병원에서 수개월에 한번 식전, 식후 혈당검사를 하여 혈당이 좋다고 만족 해서는 안됩니다. 당뇨인들은 자신의 하루 24시간동안의 모든 혈당수치에 관심을 가져야 하며 이런 의미에서 자신이 스스로 혈당을 평소에 측정하는 것이 매우 중요하다 할 수 있겠습니다.\n',
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
              Image.asset(
                'images/img1.png',
                width: MediaQuery.of(context).size.width,
              ),



              // 왜 측정해야 하는가?????
              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   자가 혈당측정을 하기위해서는 다음의\n   내용을 반드시 숙지해야 합니다.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0,10,30,5),
                child: Text(
                  "- 혈당 측정기 사용방법\n"
                  "- 혈당 검사의 빈도와 시간\n"
                  "- 혈당조절의 목표\n"
                  "- 혈당측정 결과를 기록하는 방법\n"
                  "- 혈당이 목표에서 벗어 났을 때 관리방법\n",
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