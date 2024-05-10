import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth.dart';
import 'package:flutter_application_1/auth/login_or_register.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:AuthPage(),
      ),
    );
  }
}