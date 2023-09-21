import 'package:first_layout/blocs/firebase_user_bloc/login_bloc.dart';
import 'package:first_layout/blocs/lead_info_bloc/lead_info_bloc.dart';
import 'package:first_layout/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:first_layout/screens/CloudGO/splash_screen/hello.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(
              create: (BuildContext context) => LoginInfoBloc()),
          BlocProvider(
              create: (BuildContext context) => UserInfoBloc()),
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
        home: Hello(),
      ));
  }
}
