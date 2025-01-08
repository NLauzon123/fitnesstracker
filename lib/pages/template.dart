import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Fitness Tracker Template View",
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
        onPressed: () async {await Navigator.pushNamed(context, "/");},
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout_rounded)
      ),
    );
  }
}