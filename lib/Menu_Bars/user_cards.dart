//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:path/path.dart';

class UsersCardsPage extends StatefulWidget {
  @override
  State<UsersCardsPage> createState() => _UsersCardsPageState();
}

class _UsersCardsPageState extends State<UsersCardsPage> {
  var userProfile;
  final db = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage('assets/LPL_logo.png'),
                      fit: BoxFit.contain,
                    )
                )
            ),
            Container(
              color: Color.fromRGBO(255,255,255,0.9),
            ),
/*            SizedBox(height: 50,),
            StreamBuilder(stream: db.child('CardsNotAvailable')
                .orderByKey()
                .limitToLast(5)
                .onValue,
            builder: (context,snapshot){
             final tilesList = <ListTile> [];
             if(snapshot.hasData) {
               final cardsList = Map<String,dynamic>.from(
                   (snapshot.data! as Event).snapshot.value);
               cardsList.forEach((key, value) {
                 final nextCard = Map<String,dynamic>.from(value);
                 final orderTile = ListTile(
                   leading: Icon(Icons.local_cafe),
                   title: Text(nextCard['Name']),
                   subtitle: Text(nextCard['Score']));
                 tilesList.add(orderTile);
               });
             }
             return ListView(
               children: tilesList,
             );
            },
            )*/
          ],
        )
    );
  }
}




