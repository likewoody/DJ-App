import 'package:dj_app/component/appbar.dart';
import 'package:flutter/material.dart';

class Diabetes extends StatelessWidget {
  const Diabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(titleName: '당뇨병이란?'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [

              // 당뇨병 정의
              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   당뇨병 정의',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(30,5,30,5),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "당뇨병이란 혈액 속의 포도당 수치가 정상인보다 높은 상태를 말하며, 우리 몸에서 에너지로 사용되어야 하는 포도당이 소변으로 빠져 나온다 하여 이름이 붙여진 병입니다.\n음식을 섭취하면 위장관에서 소화되어 ",
                        style: TextStyle(
                          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        children: const [
                          TextSpan(
                            text: "'포도당'",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          TextSpan(
                            text: "으로 바뀌어 혈액속으로 흡수됩니다."
                          )
                        ],
                      ),
                      const TextSpan(
                        text: " 혈액속에 들어간 포도당을 "
                      ),
                      const TextSpan(
                        text: "'혈당' ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const TextSpan(
                        text: "이라고 하며, 혈당은 세포로 이동되어 우리가 활동하는데 필요한 에너지로 쓰이게 됩니다. 혈당이 세포로 들어가 에너지로 사용되기 위해서는 췌장에서 만들어지는 "
                      ),
                      const TextSpan(
                        text: "'인슐린' ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const TextSpan(
                        text: "이라는 호르몬이 반드시 필요합니다. 당뇨병은 이러한 인슐린이 정상적으로 분비되지 않거나, 분비가 되더라도 제 기능을 하지 못하는 것입니다. 그 결과로 세포로 들어가지 못한 포도당이 혈액 내로 계속 쌓이게 되면서 고혈당을 일으키게 됩니다.\n"
                      )
                    ],
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),


              // 당뇨병 분류
              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   당뇨병 분류',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,5,30,5),
                child: Text(
                  '당뇨병은 임상적 양상에 따라 크게 제1형과 제2형으로 분류합니다.\n',
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
              Image.asset(
                'images/diabetes_category.png',
                width: MediaQuery.of(context).size.width,
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
            ],
          ),
        ),
      ),
    );
  }
}