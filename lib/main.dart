import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/splashscreen.dart';
import 'package:project/shared/components/blocobserver.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/network/local/cache_helper.dart';
import 'package:project/shared/styles/themes.dart';

import 'layout/doctor/doctorcubit/cubit.dart';
import 'layout/student/studentcubit/cubit.dart';
import 'layout/supervisor/supervisorcubit/cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  await cacheHelper.init();
  Bloc.observer = MyBlocObserver();
  ROLE = cacheHelper.getdata(key:'role');
  UID = cacheHelper.getdata(key: 'uId');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

       BlocProvider(create:  (context) => studentLayoutcubit()..getStudentData()),
        BlocProvider(create:  (context) => doctorLayoutcubit()..getDoctorData()),
        BlocProvider(create:  (context) => supervisorLayoutcubit()..getSupervisorData()..getAllDoctors()),

      ],
      child: MaterialApp(
         theme: lighttheme, // lightmode
         darkTheme: darktheme, //darkmode
         themeMode:ThemeMode. light,
         debugShowCheckedModeBanner: false,
          home:splashScreen(),
      ),
    );
  }
  }
