import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/View/Auth/Page/splash_page.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:coursia/View/Home/Page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.removeAfter((p0) => initialization(p0));
  initialization();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

Future initialization() async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoursesBloc>(create: (_) => CoursesBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Coursia',
            theme: AppTheme.getTheme(),
            home: child,
          );
        },
        child: const HomePage(),
      ),
    );
  }
}
