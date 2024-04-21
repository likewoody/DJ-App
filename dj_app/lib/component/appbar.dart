import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;
  const AppBarComponent({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      title: Column(
        children: [
          Image.asset(
            'images/dangjin_Logo.png',
            width: 150,
            height: 80,
            fit: BoxFit.fill,
          ),
          Text(titleName),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
