import 'package:dj_app/component/appbar.dart';
import 'package:flutter/material.dart';

class FoodDiabetes extends StatelessWidget {
  const FoodDiabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  '식사요법',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),



              const Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   당뇨식은 건강식 입니다',
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
                  '당뇨병 또는 당뇨병 전단계라는 말을 듣게 되면 무엇을 어떻게 먹어야 하는지, 그리고 무엇을 먹을 수 없는지에 대한 의문이 생기게 됩니다. ‘이제는 좋아하는 음식을 먹을 수 없는 걸까? 외식이나 친한 친구의 식사초대를 거절해야 할까? 당뇨병 때문에 식단을 모두다 바꾸어야 할까?’ 대답은 ‘아니오’입니다.',
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,5),
                child: Image.asset(
                  'images/img2.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  "당뇨병이라고 해서 먹으면 안 되는 음식은 없습니다. 좋아하는 음식을 포기하거나 외식을 그만둘 필요도 없습니다. 그러나 음식이 혈당에 어떠한 영향을 미치는가를 알고 ‘알맞은 양을, 골고루, 규칙적으로’ 먹는 식사 습관을 지켜야 합니다. 당뇨식은 혈당관리에 도움을 줄 뿐만 아니라 다른 건강문제까지도 해결할 수 있는 ‘건강식’ 입니다. 당뇨교육자와의 상담을 통해 다음의 기술을 배워보세요.\n\n"
                  "ㅁ 탄수화물(당질)의 양 확인하기\n"
                  "ㅁ 영양 성분표 읽어보기\n"
                  "ㅁ 음식의 양을 눈대중과 저울로 확인하기\n"
                  "ㅁ 고혈당과 저혈당 예방하기\n"
                  "ㅁ 건강한 식단을 위한 목표 세우기\n",
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
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '필수 3대 영양소는 ',
                      ),
                      TextSpan(
                        text: "탄수화물, 단백질, 지방",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(
                        text: "입니다. 세가지 영양소가 함유된 식품군이 골고루 포함되도록 식단을 구성해야 합니다. 특히 곡류, 과일, 우유에 포함되어 있는 탄수화물은 우리 몸의 주요 에너지원으로써 식후 혈당상승에 직접적인 영향을 주므로 알맞게 섭취해야 합니다. 영양상담을 통해 식품에 포함된 탄수화물 양을 확인하세요.\n"
                      )
                    ],
                  ),
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
                      '   단순당과 복합당?',
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
                  '단순당(설탕, 음료수, 사탕 등)은 복합당(곡류, 과일)보다 소화가 빠르므로 혈당을 급속히 올립니다. 따라서 저혈당 일때는 단순당을 섭취해야 하지만 식단을 계획할 때는 탄수화물(당질)의 양을 확인하되 단순당이 포함된 음식은 가급적 줄이도록 합니다',
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,5),
                child: Image.asset(
                  'images/img3.png',
                  width: MediaQuery.of(context).size.width,
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
                  "1. 규칙적인 식사를 하되 식사간격은 늦어도 6시간 이내를 지키세요. 오래 굶다가 식사를 하면 오히려 과식을 할 수 있으며 식후혈당이 더 올라가기도 합니다.\n"
                  "2. 야채, 과일, 곡류는 섬유질 함량이 많은 것을 선택하여 드세요.\n"
                  "3. 영양삼담을 통해 알맞은 양의 간식(과일 또는 우유)을 확인하고 식간에 드세요.\n"
                  "4. 내게 허용된 지방섭취량은 얼마큼인지 반드시 확인하세요',\n",
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