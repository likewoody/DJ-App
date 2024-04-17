import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Pikachu',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            accountEmail: Text(
              'Pikachu@naver.com',
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
                onPressed: () {
                  //
                },
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
              onPressed: () {
                //
              },
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
