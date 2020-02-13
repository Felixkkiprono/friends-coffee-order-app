import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/screens/home/brewlist.dart';
class Home extends StatelessWidget {

  final AuthService _auth =AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[600],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[700],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed:() async{
                await _auth.signOut();
              },
               icon:  Icon(Icons.person),
                label: Text('Log Out'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}