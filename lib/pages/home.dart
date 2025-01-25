import 'package:flutter/material.dart';
import '../models/user.dart';
import '../database/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Map userData = {};
    userData = ModalRoute.of(context)!.settings.arguments as Map;
    User user = userData["user"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Text(
          "Welcome ${user.getUsername()}!",
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
                "Home menu:",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 500,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                          context, 
                          "/account",
                          arguments: {"user": user}
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black,),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 105,
                              child: Image(image: AssetImage("assets/account.jpg"), fit: BoxFit.fill),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Account",
                              style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                            )
                          ]
                        ),
                      )
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                          context, 
                          "/activities",
                          arguments: {"user": user}
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black,),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 105,
                              child: Image(image: AssetImage("assets/activities.jpg"), fit: BoxFit.fill),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Activities",
                              style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                            )
                          ]
                        ),
                      )
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                          context, 
                          "/events",
                          arguments: {"user": user}
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black,),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 105,
                              child: Image(image: AssetImage("assets/events.jpg"), fit: BoxFit.fill),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Events",
                              style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                            )
                          ]
                        ),
                      )
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                          context, 
                          "/fitness",
                          arguments: {"user": user}
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black,),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 105,
                              child: Image(image: AssetImage("assets/fitness.jpg"), fit: BoxFit.fill),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Fitness",
                              style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                            )
                          ]
                        ),
                      )
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                          context, 
                          "/network",
                          arguments: {"user": user}
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black,),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 105,
                              child: Image(image: AssetImage("assets/network.jpg"), fit: BoxFit.fill),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Network",
                              style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                            )
                          ]
                        ),
                      )
                    ),
                  ],
                ),
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