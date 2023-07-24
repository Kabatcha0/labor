import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/modules/splash.dart';
import 'package:labor/shared/network/local/local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaborCubit(),
      child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:
                  const AppBarTheme(color: Colors.white, elevation: 0)),
          debugShowCheckedModeBanner: false,
          home: const Splash()),
    );
  }
}
