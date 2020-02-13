import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars,String name,int strength) async{
    return await brewCollection.document(uid).setData({
      'sugars':sugars,
      'name':name,
      'strength':strength,
    });
  }
  //brewlist from snapshop
List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
  return snapshot.documents.map((doc){
    return Brew(
      name:doc.data['name']??'',
      strength:doc.data['strength']?? '',
      sugars: doc.data['sugars']??'0'
    );
  }).toList();
}

  //get brews stream

  Stream<QuerySnapshot> get brews{
    return brewCollection.snapshots();
  }
}