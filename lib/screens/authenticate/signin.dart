import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 0.0,
        title: Text('Sign In To Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
        child: RaisedButton(
          child: Text('Sign In anonymously'),
          onPressed: () async {
            dynamic result = await _auth.signInAnonymously();
            if (result == null){
              print('Error Signing In');
            }else{
              print('Signed In');
              print(result.uid);
            }
          }
        ),
      ),
    );
  }
}