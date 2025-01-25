import 'package:flutter/material.dart';
import '../database/auth.dart';
//import '../database/cloud_db.dart';
import '../models/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    User user = User();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text(
          "Fitness Tracker Login",
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
                "Please log in:",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(10),
                width: 240,
                height: 320,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/LoginPage.jpg"), fit: BoxFit.fill,),
                  border: Border.all(color: Colors.black,),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(height: 60.0),
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
                      const SizedBox(height: 10.0),
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
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, 
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _authService.loginWithEmailPassword(email, password);
                            if (result == null) {
                              setState(() {error= "Error logging in";});
                            }
                            else {
                              //Map searchMap = await _databaseService.getUserInfo(email);
                              //print(searchMap);
                              user.setUsername(email);
                              user.setPassword(password);
                              user.setAge(0);
                              user.setHeight(0.0);
                              user.setWeight(0.0);
                              user.setLocation("");
                              setState(() {
                                emailController.text = "";
                                passwordController.text = "";
                                error = "";
                                Navigator.pushNamed(context, "/home", arguments: {"user": user});
                              });
                            }
                          }
                        }, 
                        child: const Text("Log in")
                      )
                    ]
                  )
                ) 
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  await Navigator.pushReplacementNamed(context, "/signup", arguments: {});
                }, 
                child: const Text("Not registered yet\n Please sign up"),
              ),
              const SizedBox(height: 10.0),
              Text(error, style: const TextStyle(color: Colors.red, fontSize: 16),),
            ]
          )
        )
      )
    );
  }
}

