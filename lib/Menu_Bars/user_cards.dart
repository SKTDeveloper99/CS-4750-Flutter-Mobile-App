//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        var uid = user.uid;
        FirebaseDatabase.instance.reference().child("users/" + uid).once()
            .then((ds) {
          print(ds.value);
          userProfile = ds.value;
          setState(() {

          });
        }).catchError((error) {
          print("Failed to retrieve user's information");
        }
        );
      }
    });

    super.initState();
  }

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
              color: Color.fromRGBO(255,255,255,0.7),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "${userProfile['username']}"
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400
              ),
              ),
            ),
            Container(
              child: Image.network("https://cdn1.dotesports.com/wp-content/uploads/2019/05/12144901/MSIFaker.jpg"),
            ),
          ],
        )
    );
  }
}




