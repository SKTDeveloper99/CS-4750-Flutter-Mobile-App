//import 'dart:async';

import 'package:cs4750_mobileapp/Functionaries/take_photo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart' ;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userProfile ;
  var profilePic;
  var username;
  var location;
  var description;
  //late StreamSubscription streamy;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        var uid = user.uid;
        FirebaseDatabase.instance.reference().child("users/" + uid).onValue.listen((event){
          print(event.snapshot.value);
          userProfile = event.snapshot.value;
          setState(() {
            username = userProfile["username"];
            profilePic = userProfile["profilePic"];
            location = userProfile["location"];
            description = userProfile["description"];
          });
        }).onError((error) {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/RNG_2021_Summer.jpg'),
                      fit: BoxFit.fill,
                    )
                ),

                child: Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment(0.0,2.5),
                  child: GestureDetector(
                    onTap: () async {
                      final cameras = await availableCameras();
                      final firstCamera = cameras.first;

                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera)),
                      );

                      profilePic = result;
                      setState(() {
                        FirebaseDatabase.instance.reference().child("users/" + userProfile['uid'])
                            .set(userProfile).then((value) {
                          print("Update the user profile!");
                        }).catchError((error) {
                          print("Fail to update user profile");
                        });

                      });
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          profilePic == null ? 'https://img.redbull.com/images/c_limit,w_1500,h_1000,f_auto,q_auto/redbullcom/2020/12/16/c61kpj1fxidgnwiqgz2h/faker-t1-main' : profilePic
                      ),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "$username"
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$location"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$description"
                ,style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
            ],
          ),
        )
    );
  }
}
