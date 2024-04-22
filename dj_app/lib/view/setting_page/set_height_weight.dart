import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/component/setting_appbar.dart';
import 'package:dj_app/vm/vm_provider_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetHeightWeight extends StatelessWidget {
  SetHeightWeight({super.key});
  
  // Property
  String userEmail = '';
  var provider; 

  // ---- View 1 -----
  Widget _scaffold(context) {
  return Scaffold(
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ChangeNotifierProvider<VMProviderCommon>(
        create: (context) => VMProviderCommon(),
        builder: (context, child) {
          provider = Provider.of<VMProviderCommon>(context);
          provider.whichOne = '키/몸무게';
          userEmail = provider.getStorageUserEmail();
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
            print("provider.userEmail check : ${provider.userEmail}");
            print("provider.userEmail check : ${provider.selectedHeight}");
            print("provider.userEmail check : ${provider.selectedWeight}");
            provider.updateHeight();
            provider.showSuccessfulAlert();
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

  // ---- View 2 ----
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
          return _bodySecondView(documents);
        }
      )
    );
  }

  // ---- View 3 ----
  Widget _bodySecondView(document){
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
          // ElevatedButton(
          //   onPressed: () {
              // print(id);
          //     print(provider.selectedHeight);
          //     print(provider.selectedWeight);
          //     FirebaseFirestore.instance
          //     .collection('user')
          //     .doc(id)
          //     .update(
          //       {
          //         'height' : provider.selectedHeight,
          //         'weight' : provider.selectedWeight,
          //       }
          //     );
          //     provider.showSuccessfulAlert();
          //   }, 
          //   child: const Text('키/몸무게 설정')
          // ) 
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingAppbar(titleName: '키/몸무게 설정', builder: _scaffold(context));
  }
}