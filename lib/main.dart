import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'pages/template.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const Login(),
      "/signup": (context) => const Signup(),
      "/home": (context) => const Home(),
      "/template": (context) => const Template(),
    },
  ));
}

