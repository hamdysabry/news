import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/Shared_component/Themes/mytheme.dart';
import 'package:news/pages/home_page.dart';
import 'package:news/pages/login/login_screen.dart';
import 'package:news/pages/register/register_screen.dart';
import 'package:news/pages/splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.LightTheme,
      initialRoute: splashScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        splashScreen.routeName: (context) => const splashScreen(),
        homeScreen.routeName: (context) => const homeScreen(),
      },
    );
  }
}
