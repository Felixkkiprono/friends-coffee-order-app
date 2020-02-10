//import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //final AuthService _auth = AuthService();
  //text field state
  String email ='';
  String password='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Register'))
        ],
        backgroundColor: Colors.brown[600],
        elevation: 0.0,
        title: Text('Sign In To Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged:(val){
                  setState(() => email = val);
                }
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText:true,
                onChanged: (val){
                  setState(() => password =val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: ()async{
                  print(email);
                  print(password);
                },
                color: Colors.grey[300],
                child: Text('Sign In'),)
            ],
          ),
        )
      )
    );
  }
}