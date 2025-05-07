import 'package:ecommerceshoppingapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/onboarding/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      home: SplashScreen(),
    );
  }
}
