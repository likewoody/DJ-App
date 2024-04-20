import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/vm/vm_provider_enquire.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class Enquire extends StatelessWidget {
  Enquire({super.key});

  // Property
  final TextEditingController titleCon = TextEditingController();
  final TextEditingController contextCon = TextEditingController();
  final TextEditingController dateCon = TextEditingController();
  var provider;
  String userEmail = 'sdakfdslkf@naver.com';
  // 이메일 넘겨 받아야함
// 이메일 넘겨 받아야함
// 이메일 넘겨 받아야함
// 이메일 넘겨 받아야함
// 이메일 넘겨 받아야함
// 이메일 넘겨 받아야함



  Widget _bodyView(provider, context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          
          // 제목
          Padding(
            padding: const EdgeInsets.fromLTRB(40,50,40,40),
            child: TextField(
              controller: titleCon,
              decoration: const InputDecoration(
                labelText: '제목',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                )
              ),
            ),
          ),
            
            
          // context
          SizedBox(
            height: 290,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40,0,40,0),
              child: TextField(
                maxLines: 10,
                controller: contextCon,
                decoration: const InputDecoration(
                  labelText: '내용',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  )
                ),
              ),
            ),
          ),

          // 사진 선택
          ElevatedButton(
            onPressed: () => provider.chooseFromGallery(ImageSource.gallery), 
            child: const Text('사진 선택'),
          ),


          // 이미지 담는 박스
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Center(
                child: provider.checkNewImage
                ? Image.file(File(provider.selectedImg.path))
                : const Text('there is no image...')
              ),
            ),
          ),

          // 문의 완료 버튼
          // ElevatedButton(
          //   onPressed: () {
          //     provider = titleCon.text;
          //     provider.insertEnquire();

          //   }, 
          //   child: const Text('문의완료')
          // ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('문의하기'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
                  .collection('enquire')
                  // .orderBy(field)
                  .snapshots(),
          builder: (context, snapshot) {
            if (! snapshot.hasData){
              return const Center(child: CircularProgressIndicator());
            }
            final documents = snapshot.data!.docs;
            return ChangeNotifierProvider(
              create: (context) => VMProviderEnquire(),
              builder: (context, child) {
                provider = Provider.of<VMProviderEnquire>(context);
                return _bodyView(provider, context);
              },
            );
          },
        ),
        // bottomNavi
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
          ),
          height: 100,
          child: TextButton(
            onPressed: () {
              provider.title = titleCon.text;
              provider.context = contextCon.text;
              provider.insertEnquire(userEmail);
            }, 
            child: Text(
              '문의완료',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary
              ),
            ),
          ),
        ),
      ),
    ); 
  }
}