import 'package:ecommerceshoppingapp/routes.dart';
import 'package:ecommerceshoppingapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/onboarding/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
   
  await Hive.initFlutter();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), 
      minTextAdapt: true,
      builder: (context,child) {
        return MaterialApp.router(
          title: 'Shopping',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        
          routerConfig: goRouter,
        );
      }
    );
  }
}
