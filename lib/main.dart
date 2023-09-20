import 'package:first_layout/blocs/lead_info_bloc/lead_info_bloc.dart';
import 'package:first_layout/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:first_layout/screens/CLoudWORK/cloud_work.dart';
import 'package:first_layout/screens/CloudCALL/danh_ba/danh_ba.dart';
import 'package:first_layout/screens/CloudGO/dang_nhap_screen/dang_nhap_screen.dart';
import 'package:first_layout/screens/CloudGO/home_screen/home_screen.dart';
import 'package:first_layout/screens/CloudGO/splash_screen/hello.dart';
import 'package:first_layout/screens/CloudGO/splash_screen/splash_screen.dart';
import 'package:first_layout/screens/CloudSALES/screens/home/calendar/danh_sach.dart';
import 'package:first_layout/screens/CloudSALES/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter_bloc/flutter_bloc.dart";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const DangNhap(),
  //   );
  // }
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(
              create: (BuildContext context) => UserInfoBloc()
          ),
          BlocProvider(
              create: (BuildContext context) => LeadInfoBloc())
        ],
        child:
        MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CloudGO',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Calendar(),
      ));
  }
}
