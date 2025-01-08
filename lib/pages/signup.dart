import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Fitness Tracker Signup",
          style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)
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
                "Please enter your vitals:",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                height: 600,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/SignUpPage.jpg"), fit: BoxFit.fill,),
                  border: Border.all(color: Colors.black,),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}