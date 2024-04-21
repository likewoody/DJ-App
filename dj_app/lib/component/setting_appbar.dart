import 'package:flutter/material.dart';

class SettingAppbar extends StatelessWidget {
  final String titleName;
  final Widget builder;
  const SettingAppbar({super.key, required this.titleName, required this.builder});



  Widget _settingAppbar(context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(titleName),
      ),
      body: builder,
    );
  }  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _settingAppbar(context),
    );
  }
}