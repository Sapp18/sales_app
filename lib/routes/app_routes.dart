import 'package:flutter/material.dart';
import 'package:sales_app/screens/screens.dart';

class AppRoutes {
  //Auth
  static const signInScreen = 'signInScreen';
  static const signUpScreen = 'signUpScreen';
  static const profileScreen = 'profileScreen';
  static const homeScreen = 'homeScreen';
  static const staffScreen = 'staffScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    //Auth
    signInScreen: (_) => const SignInScreen(),
    signUpScreen: (_) => const SignUpScreen(),
    homeScreen: (_) => const HomeScreen(),
    staffScreen: (_) => const StaffScreen(),
  };
}
