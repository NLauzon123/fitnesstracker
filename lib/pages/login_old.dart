import 'package:flutter/material.dart';
import '../database/local_db.dart';
import '../models/user.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User();
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(height: 60.0),
                      TextField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3.0),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Enter username", 
                          labelText: "Username: "
                        ),
                        controller: usernameController,
                        style: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3.0),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Enter password", 
                          labelText: "Password: "
                        ),
                        controller: passwordController,
                        style: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, 
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          bool good = true;
                          String msg = "";
                          if (usernameController.text == "") {
                            msg = "Please enter a username";
                            good = false;
                          }
                          else if (passwordController.text == "") {
                            msg = "Please enter a password";
                            good = false;
                          }
                          else {
                            List userMap = await LocalDatabase().searchByUsername(username: usernameController.text);
                            if (userMap.isEmpty) {
                              msg = "Invalid username";
                              good = false;
                            }
                            else if (passwordController.text != userMap[0]["password"]) {
                              msg = "Invalid password";
                              good = false;
                            }
                            else {
                              user.setUsername(userMap[0]["username"]);
                              user.setPassword(userMap[0]["password"]);
                              user.setAge(userMap[0]["age"]);
                              user.setHeight(userMap[0]["height"]);
                              user.setWeight(userMap[0]["weight"]);
                              user.setLocation(userMap[0]["location"]);
                            }
                          }
                          if (!good) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                msg,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                          else {
                            await Navigator.pushNamed(
                              context, 
                              "/home",
                              arguments: {"user": user}
                            );
                          }
                        }, 
                        child: const Text("Log in")
                      )
                    ]
                  )
                ) 
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  await Navigator.pushNamed(
                    context, 
                    "/signup",
                    arguments: {}
                  );
                }, 
                child: const Text("Not registered yet\n Please sign up"),
              )
            ]
          )
        )
      )
    );
  }
}

