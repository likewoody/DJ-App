import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/vm/vm_provider_height.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetHeightWeight extends StatelessWidget {
  final provider = VMProviderHeightWeight();
  SetHeightWeight({super.key, provider});

  // ---- StreamBuilder ----
  Widget _streamBuilder(){
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
          return _view();
        }
      )
    );
  }

  // ---- View ----
  Widget _view(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,50,20,50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
          
              // 키
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        provider.selectedHeight = value;
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
                        provider.selectedWeight = value;
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
        ElevatedButton(
          onPressed: () {}, 
          child: const Text('키/몸무게 설정')
        ) 
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('키/몸무게 설정'),
      ),
      body: _streamBuilder(),
    );
  }
}