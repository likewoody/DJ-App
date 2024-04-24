import 'package:dj_app/component/appbar.dart';
import 'package:flutter/material.dart';

class SettingAppbar extends StatelessWidget {
  final String titleName;
  final Widget builder;
  const SettingAppbar({super.key, required this.titleName, required this.builder});

  Widget _settingMainAppbar(context){
    return Scaffold(
      body: builder,
    );
  }  

  Widget _settingAppbar(context){
    return Scaffold(
      appBar: AppBarComponent(titleName: titleName,),
      body: builder,
    );
  }  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      
      child: titleName == '설정'
      ? _settingMainAppbar(context)
      : _settingAppbar(context)
    );
  }
}