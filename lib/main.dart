import 'package:first_layout/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:first_layout/screens/CloudGO/dang_nhap_screen/dang_nhap_screen.dart';
import 'package:first_layout/screens/CloudGO/home_screen/home_screen.dart';
import 'package:first_layout/screens/CloudGO/lien_he_screen/lien_he_screen.dart';
import 'package:first_layout/screens/CloudGO/main_page/bottom_navigation_bar.dart';
import 'package:first_layout/screens/CloudGO/profile/HoSoCaNhan/profile.dart';
import 'package:first_layout/screens/CloudGO/profile/HoSoCaNhan/sua_thong_tin_tai_khoan.dart';
import 'package:first_layout/screens/CloudGO/profile/menu_account.dart';
import 'package:first_layout/screens/CloudSALES/screens/home/home.dart';
import 'package:first_layout/screens/test/test_screen.dart';
import 'package:first_layout/screens/CloudGO/tin_tuc_screen/tin_tuc_screen.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
void main() {
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
        ],
        child:    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ));
  }
}
