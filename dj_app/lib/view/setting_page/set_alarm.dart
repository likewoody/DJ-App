import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/vm/vm_provider_alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SetAlarm extends StatelessWidget {
  SetAlarm({super.key});

  // Property
  var provider;
  String id = '';

  // ---- Functions ----
  _showSuccessfulAlert() {
    Get.defaultDialog(
      title: '변경 완료',
      middleText: '알림 변경이 완료 되었습니다.',
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

  Widget _bodyView(provider){
    return StreamBuilder(
      stream: FirebaseFirestore.instance
              .collection('user')
              // .orderBy()
              .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(),);
        }
        var documents = snapshot.data!.docs;
        id = documents[0].id;
        return Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,180,0,0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,50,0,15),
                  child: Switch(
                    value: provider.alarmSwitch, 
                    onChanged: (value) {
                      provider.changedAlarm(value);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                    .collection('user')
                    .doc(id)
                    .update({
                      'alarm' : provider.alarmSwitch
                    });
                    print('successful');
                    _showSuccessfulAlert();
                  }, 
                  child: const Text('알림 설정하기')
                ),
              ],
            ),
          ),
        );

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('알림 설정'),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ChangeNotifierProvider<VMProviderAlarm>( 
          create: (context) => VMProviderAlarm(),
          builder: (context, child) {
            provider = Provider.of<VMProviderAlarm>(context);
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
            FirebaseFirestore.instance
            .collection('user')
            .doc(id)
            .update({
              'alarm' : provider.alarmSwitch
            });
            print('successful');
            _showSuccessfulAlert();
          }, 
          child: Text(
            '이메일 설정',
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