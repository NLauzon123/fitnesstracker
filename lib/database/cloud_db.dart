import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future addUserInfo(int usercount, String email, int age, double height, double weight, String location) async {
    await ref.child("users").child(usercount.toString()).set({
      "email": email,
      "age": age,
      "height": height,
      "weight": weight,
      "location": location
    });
  }

  Future getUserInfo(String email) async {
    final snapshot = await ref.child('users').child('email').equalTo(email).get();
    if (snapshot.exists) {print("successful get"); return snapshot.value;} 
    else {print("unsuccessful get"); return {};}
  }

  Future getUserCount() async {
    final snapshot = await ref.child('usercount').get();
    if (snapshot.exists) {return snapshot.value;} 
    else {return {};}
  }

  Future updateUserCount(int count) async {
    await ref.update({"usercount": count});
  }
}