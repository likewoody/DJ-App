import 'package:dj_app/component/appbar.dart';
import 'package:dj_app/view/drawer_view/prevent/check_blood.dart';
import 'package:dj_app/view/drawer_view/prevent/exercise.dart';
import 'package:dj_app/view/drawer_view/prevent/food.dart';
import 'package:dj_app/view/drawer_view/prevent/lowBP.dart';
import 'package:dj_app/view/drawer_view/prevent/tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreventDiabetes extends StatelessWidget {
  const PreventDiabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(titleName: '당뇨병 예방법'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,80,0,20),
                  child: ElevatedButton(
                    onPressed: () => Get.to(const BloodCheck()), 
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    child: const Text(
                      '자가혈당측정법',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),   


              SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: ElevatedButton(
                    onPressed: () => Get.to(const FoodDiabetes()), 
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    child: const Text(
                      '식사요법',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),     


              SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: ElevatedButton(
                    onPressed: () => Get.to(const ExerciseDiabetes()), 
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    child: const Text(
                      '운동요법',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),  


              SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: ElevatedButton(
                    onPressed: () => Get.to(const TabletDiabetes()), 
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    child: const Text(
                      '약물요법',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),        


              SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: ElevatedButton(
                    onPressed: () => Get.to(const LowBP()), 
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    child: const Text(
                      '저혈당대처법',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),
              SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    child: const Text(
                      '고혈당대처법',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),        


              SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    child: const Text(
                      '스트레스관리법',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),
              
            ]
          ),
        ),
      ),
    );
  }
}