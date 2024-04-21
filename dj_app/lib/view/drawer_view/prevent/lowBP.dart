import 'package:dj_app/component/appbar.dart';
import 'package:flutter/material.dart';

class LowBP extends StatelessWidget {
  const LowBP({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarComponent(titleName: '약물요법'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   저혈당이란?',
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
                  "저혈당이란, 혈액 속의 포도당의 농도가 필요량보다 모자라는 상태를 말합니다. 대체로 혈당이 70mg/dL 이하로 떨어지게 되면 에너지가 부족하다는 신호로 저혈당의 증상이 오게 됩니다.  경우에 따라서는 혈당치가 정상수준 이더라도 급격히 혈당이 떨어지는 경우에는 증상이 올 수 있습니다.",
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   저혈당의 증상',
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
                  "1단계(경고단계) : 저혈당의 초기 증상",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  "배고픔, 불안하고 흥분이 잘됨, 온몸이 떨림, 두통, 기운이 쫙 빠지고 어지러움, 가슴이 두근거림, 식은땀, 손끝이나 혀,입술 주위가 무감각하거나 저려옴.",
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),


              Padding(
                padding: EdgeInsets.fromLTRB(30,30,0,5),
                child: Row(
                  children: [
                    Icon(Icons.check_box),
                    Text(
                      '   저혈당의 증상',
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
                  "1단계(경고단계) : 저혈당의 초기 증상",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,30,5),
                child: Text(
                  "배고픔, 불안하고 흥분이 잘됨, 온몸이 떨림, 두통, 기운이 쫙 빠지고 어지러움, 가슴이 두근거림, 식은땀, 손끝이나 혀,입술 주위가 무감각하거나 저려옴.",
                  style: TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}