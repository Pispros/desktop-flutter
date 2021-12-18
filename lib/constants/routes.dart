import 'package:demo_app/Screens/Welcome/welcome.dart';
import 'package:demo_app/Screens/auth.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes(BuildContext context) {
  return {
    "": (context) => AuthScreen(),
    "login": (context) => AuthScreen(),
    "welcome": (context) => WelcomeScreen(),
  };
}
