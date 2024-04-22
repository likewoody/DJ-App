import 'package:dj_app/firebase_options.dart';
import 'package:dj_app/view/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // * 날짜 형식화를 위해 initializeDateFormatting() 메서드 호출
  // * 한국어 Locale를 사용한다.
  // * import는 package:intl/date_symbol_data_local.dart
  await initializeDateFormatting("ko_KR");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 239, 74, 63)),
          useMaterial3: true,
        ),
        home: const LoginView()
      );
  }
}
