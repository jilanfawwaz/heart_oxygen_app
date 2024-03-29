import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_oxygen_alarm/cubit/auth/auth_cubit.dart';
import 'package:heart_oxygen_alarm/cubit/bottompage/bottompage_cubit.dart';
import 'package:heart_oxygen_alarm/cubit/news/news_cubit.dart';
import 'package:heart_oxygen_alarm/cubit/map/map_cubit.dart';
import 'package:heart_oxygen_alarm/cubit/newsmakananolahraga/newsmakananolahraga_cubit.dart';
import 'package:heart_oxygen_alarm/pages/homepage.dart';
import 'package:heart_oxygen_alarm/pages/homepagescreen/halamanmakanandanolahraga.dart';
import 'package:heart_oxygen_alarm/pages/homepagescreen/halamanprofil.dart';
import 'package:heart_oxygen_alarm/pages/homepagescreen/homediagram.dart';
import 'package:heart_oxygen_alarm/pages/loginpage.dart';
import 'package:heart_oxygen_alarm/pages/registerpage.dart';
import 'package:heart_oxygen_alarm/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottompageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => MapCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
        BlocProvider(
          create: (context) => NewsMakananOlahragaCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          /* brightness: Brightness.dark,
          primaryColorDark: Colors.amber,
          primaryColor: Colors.cyan,
          primarySwatch: Colors.green,*/

          //colorScheme: ColorScheme.dark(primary: Colors.cyan),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routes: {
          '/': (context) => const SplashScreen(),
          LoginPage.nameRoute: (context) => LoginPage(),
          RegisterPage.nameRoute: (context) => RegisterPage(),
          // HomePage.nameRoute: (context) => HomePage(),
          FindDevicesScreen.nameRoute: (context) => const FindDevicesScreen(),
          HomeDiagram.nameRoute: (context) => const HomeDiagram(),
          HalamanProfile.nameRoute: (context) => HalamanProfile(),
          HalamanMakananDanOlahraga.nameRoute: (context) =>
              HalamanMakananDanOlahraga(),
        },
      ),
    );
  }
}
