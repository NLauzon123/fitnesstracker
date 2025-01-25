import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      return user;
    }
    catch(e) {print(e.toString()); return null;}
    
  }
  Future loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      return user;
    }
    catch(e) {print(e.toString()); return null;}
    
  }
  Future logout() async {
    try {
      return _auth.signOut();
    } 
    catch(e) {print(e.toString()); return null;}
  }
}