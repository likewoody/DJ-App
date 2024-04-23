import 'package:dj_app/view/drawer_view/diabetes.dart';
import 'package:dj_app/view/drawer_view/prevent_diabetes.dart';
import 'package:dj_app/view/drawer_view/symptom_diabetes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerComponent extends StatelessWidget {
  DrawerComponent({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '${box.read('name')}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            accountEmail: Text(
              '${box.read('email')}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ListTile(
              leading: const Icon(
                Icons.content_paste_search_outlined,
              ),
              title: TextButton(
                onPressed: () => Get.to(const Diabetes()),
                child: const Text(
                  '당뇨병이란?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.content_paste_search_outlined,
            ),
            title: TextButton(
              onPressed: () => Get.to(const SymptomDiabetes()),
              child: const Text(
                '당뇨병 증상',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          
          ListTile(
            leading: const Icon(
              Icons.content_paste_search_outlined,
            ),
            title: TextButton(
              onPressed: () => Get.to(const PreventDiabetes()),
              child: const Text(
                '당뇨병 예방법',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.content_paste_search_outlined,
            ),
            title: TextButton(
              onPressed: () {
                //
              },
              child: const Text(
                '당뇨병에 의한 합병증',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
