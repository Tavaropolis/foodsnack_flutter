import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Pages
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        title: 'Food Snacks',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Oswald'),
        home: const Login());
  }
}
