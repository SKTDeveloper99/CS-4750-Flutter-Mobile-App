import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UsersCardsPage extends StatefulWidget {
  @override
  State<UsersCardsPage> createState() => _UsersCardsPageState();
}

class _UsersCardsPageState extends State<UsersCardsPage> {
  //firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

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
          ],
        )
    );
  }
}




