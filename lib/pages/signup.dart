import 'package:flutter/material.dart';
import '../database/auth.dart';
//import '../database/cloud_db.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  //final DatabaseService _databaseService = DatabaseService();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String email = "";
  String password = "";
  String error = "";
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
                width: 240,
                height: 400,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/SignUpPage.jpg"), fit: BoxFit.fill,),
                  border: Border.all(color: Colors.black,),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 120),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: "Enter an email",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (val) => val!.isEmpty ? "Enter an email" : null,
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: "Enter a password",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (val) => val!.length < 6 ? "Enter a password of at least 6 char" : null,
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, 
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _authService.registerWithEmailPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = "Error creating the user";
                              });
                            }
                            else {
                              //dynamic resC = await _databaseService.getUserCount();
                              //resC = resC + 1;
                              //await _databaseService.updateUserCount(resC);
                              //await _databaseService.addUserInfo(resC, email, 0, 0.0, 0.0, "");
                              setState(() {
                                emailController.text = "";
                                passwordController.text = "";
                                error = "";
                                Navigator.pushReplacementNamed(context, "/");
                              });
                            }
                          }
                        }, 
                        child: const Text("Sign Up")
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  await Navigator.pushReplacementNamed(context, "/", arguments: {});
                }, 
                child: const Text("Back to login"),
              ),
              const SizedBox(height: 10.0),
              Text(error, style: const TextStyle(color: Colors.red, fontSize: 16),),
            ],
          )
        )
      ),
    );
  }
}