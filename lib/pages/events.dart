import 'package:flutter/material.dart';
import '../database/auth.dart';
import '../models/user.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Map userData = {};
    userData = ModalRoute.of(context)!.settings.arguments as Map;
    User user = userData["user"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Events for ${user.getUsername()}",
          style: const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Fill up to your hearth's pleasure:",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 10.0),
              Container(

              ),
            ],
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _authService.logout(); 
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout_rounded)
      ),
    );
  }
}