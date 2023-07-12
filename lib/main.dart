import 'package:first_layout/screens/dang_nhap_screen/dang_nhap_screen.dart';
import 'package:first_layout/screens/home_screen/home_screen.dart';
import 'package:first_layout/screens/lien_he_screen/lien_he_screen.dart';
import 'package:first_layout/screens/main_page/main_page.dart';
import 'package:first_layout/screens/test/test%202.dart';
import 'package:first_layout/screens/test/test_screen.dart';
import 'package:first_layout/screens/tin_tuc_screen/tin_tuc_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Test(),
    );
  }
}

