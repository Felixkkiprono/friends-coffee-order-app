import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //CREATE USER OBJECT BASED ON FIREBASEUSER
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) :null;
  }

  //create change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
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
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result =await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
    print(e.toString());
    return null;
    }
  }

  //register with email and password

  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result =await _auth.createUserWithEmailAndPassword(email:email,password:password);
      FirebaseUser user =result.user;
      //create a new document for the user uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
    }catch(e){
      print(e.toString());
      return null;
    }

  }
  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}
