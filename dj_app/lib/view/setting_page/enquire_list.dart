import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnquireList extends StatelessWidget {
  EnquireList({super.key});

  var provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('문의내역'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
                .collection('enquire')
                // .orderBy(field),
                .snapshots(), 
        builder: (context, snapshot) {
          return ListView(
            
          );
        },
      ),
    );
  }
}