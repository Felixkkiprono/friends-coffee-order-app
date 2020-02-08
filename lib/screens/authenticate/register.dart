import 'package:flutter/material.dart';
//import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //final AuthService _auth = AuthService();

  //text field state
  String email ='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            },
             icon: Icon(Icons.person),
              label: Text( 'Sign In'))
        ],
        backgroundColor: Colors.brown[600],
        elevation: 0.0,
        title: Text('Sign Up To Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                onChanged:(val){
                  setState(() => email = val);
                }
              ),
              TextFormField(
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
                child: Text('Register'),)
            ],
          ),
        )
      )
    );
  }
}