

import 'package:ecommerceshoppingapp/screens/Auth/login_screen.dart';
import 'package:ecommerceshoppingapp/screens/Auth/signup_screen.dart';
import 'package:go_router/go_router.dart';

import 'screens/onboarding/on_boarding.dart';
import 'screens/onboarding/splash_screen.dart';

class Routes {
  const Routes._();
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  
  static const otpScreen = '/otpScreen';

}

// Inside your app widget
final GoRouter goRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(
        path: Routes.onboarding, builder: (context, state) => OnBoardingScreen()),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginLayout(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => SignUpLayout(),
    ),
  ],
);
