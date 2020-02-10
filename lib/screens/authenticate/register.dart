import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';
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
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: (
                  InputDecoration(
                    hintText: "Email")
                ),
                validator: (val) => val.isEmpty ? 'Enter Email' : null,
                onChanged:(val){
                  setState(() => email = val);
                }
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:('Password'),
                ),
                validator: (val) => val.length <6 ? 'Please enter a password with a minimum of 6 characters': null,
                obscureText:true,
                onChanged: (val){
                  setState(() => password =val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: ()async{
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'Enter a valid email address' );
                    }
                  }
                },
                color: Colors.grey[300],
                child: Text('Register'),),
                SizedBox(height: 10.0),
                Text(error,
                style: TextStyle(color: Colors.red,
                fontSize:14.0))
            ],
          ),
        )
      )
    );
  }
}