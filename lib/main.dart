import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'pages/account.dart';
import 'pages/activities.dart';
import 'pages/events.dart';
import 'pages/fitness.dart';
import 'pages/network.dart';
import 'pages/template.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const Login(),
      "/signup": (context) => const Signup(),
      "/home": (context) => const Home(),
      "/account": (context) => const Account(),
      "/activities": (context) => const Activities(),
      "/events": (context) => const Events(),
      "/fitness": (context) => const Fitness(),
      "/network": (context) => const Network(),
      "/template": (context) => const Template(),
    },
  ));
}

