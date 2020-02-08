import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //CREATE USER OBJECT BASED ON FIREBASEUSER
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) :null;
  }

  //sign in anonymously
  Future signInAnonymously() async{
    try{
      AuthResult results = await _auth.signInAnonymously();
      FirebaseUser user = results.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //sign out

}
