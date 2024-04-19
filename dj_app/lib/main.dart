import 'package:dj_app/firebase_options.dart';
import 'package:dj_app/view/setting_page/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 239, 74, 63)),
        useMaterial3: true,
      ),
      home: SettingPage(),
        // create: (context) => VMProviderHeightWeight(),
        // child: SettingPage(),
    );
  }
}