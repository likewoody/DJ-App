import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const AppBarComponent({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
