import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/vm/vm_provider_height.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SetHeightWeight extends StatelessWidget {
  // final id;
  SetHeightWeight({super.key});
  // SetHeightWeight({super.key, id});

  // Property
  String id = '';
  var provider;

  // ---- Functions ----
  _showSuccessfulAlert() {
    Get.defaultDialog(
      title: '변경 완료',
      middleText: '비밀번호 변경이 완료 되었습니다.',
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          }, 
          child: const Text('종료')
        ),
      ]
    );
  }

  // ---- StreamBuilder ----
  Widget _bodyView(provider){
    return Center(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
                .collection('user')
                // .orderBy('code', descending: false)
                .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),);
          }
          final documents = snapshot.data!.docs; // data 가져오기
          // print(documents[0].data());
          // 추후에 로그인 시 user ID를 통해 몇번째인지 확인할 수 있어야한다.
          // 추후에 로그인 시 user ID를 통해 몇번째인지 확인할 수 있어야한다.
          // 추후에 로그인 시 user ID를 통해 몇번째인지 확인할 수 있어야한다.
          id = documents[0].id;
          // provider.selectedHeight = documents[0].get('height');
          // provider.selectedWeight = documents[0].get('weight');
          // 추후에 로그인 시 user ID를 통해 몇번째인지 확인할 수 있어야한다.
          // 추후에 로그인 시 user ID를 통해 몇번째인지 확인할 수 있어야한다.
          // 추후에 로그인 시 user ID를 통해 몇번째인지 확인할 수 있어야한다.
          
          //   print(doc.id); // 문서의 ID 출력
          //   print(doc.get('height')); // 특정 필드의 값 출력
          //   print(doc.get('weight')); // 특정 필드의 값 출력
          return _bodySecondView(documents);
        }
      )
    );
  }

  // ---- View ----
  Widget _bodySecondView(document){
    print(id);
    print(document[0]['height']);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,180,0,0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20,50,20,50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
            
                // 키
                Column(
                  children: [
                    const Text(
                      '키',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Height PickerView
                    SizedBox(
                      width: 150,
                      height: 120,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          provider.selectedHeight = value + 130;
                          print(provider.selectedHeight);
                        }, 
                        children: List.generate(
                          provider.heightList.length, 
                          (index) => Center(
                            child: Text(provider.heightList[index].toString()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                // 몸무게
                Column(
                  children: [
                    const Text(
                      '몸무게',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Weight PickerView
                    SizedBox(
                      width: 150,
                      height: 120,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          provider.selectedWeight = value + 30;
                          print(provider.selectedWeight);
                        }, 
                        children: List.generate(
                          provider.weightList.length, 
                          (index) => Center(
                            child: Text(provider.weightList[index].toString()),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
      
          // 키/몸무게 Update 설정
          ElevatedButton(
            onPressed: () {
              print(id);
              print(provider.selectedHeight);
              print(provider.selectedWeight);
              FirebaseFirestore.instance
              .collection('user')
              .doc(id)
              .update(
                {
                  'height' : provider.selectedHeight,
                  'weight' : provider.selectedWeight,
                }
              );
              _showSuccessfulAlert();
            }, 
            child: const Text('키/몸무게 설정')
          ) 
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('키/몸무게 설정'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ChangeNotifierProvider<VMProviderHeightWeight>(
            create: (context) => VMProviderHeightWeight(),
            builder: (context, child) {
              provider = Provider.of<VMProviderHeightWeight>(context);
              return _bodyView(provider);
            },
          ),
        ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
        ),
        height: 100,
        child: TextButton(
          onPressed: () {
            print(id);
            print(provider.selectedHeight);
            print(provider.selectedWeight);
            FirebaseFirestore.instance
            .collection('user')
            .doc(id)
            .update(
              {
                'height' : provider.selectedHeight,
                'weight' : provider.selectedWeight,
              }
            );
            _showSuccessfulAlert();
          }, 
          child: Text(
            '키/몸무게 설정',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary
            ),
          ),
        ),
      ),
    );
  }
}