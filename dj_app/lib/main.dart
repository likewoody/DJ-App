import 'package:dj_app/firebase_options.dart';
import 'package:dj_app/view/login_signup/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  bool data = await fetchData();
  print(data);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // * 날짜 형식화를 위해 initializeDateFormatting() 메서드 호출
  // * 한국어 Locale를 사용한다.
  // * import는 package:intl/date_symbol_data_local.dart
  await initializeDateFormatting("ko_KR");
  FlutterNativeSplash.remove();
  runApp(const MyApp());
} // end of main()

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 239, 74, 63)),
          useMaterial3: true,
        ),
        home: const LoginView());
  }
} // end of class MyApp

// * Splash Screen Settings //
Future<bool> fetchData() async {
  bool data = false;

  // Change to API call
  await Future.delayed(const Duration(seconds: 3), () {
    data = true;
  });

  return data;
} // async function to get data from API