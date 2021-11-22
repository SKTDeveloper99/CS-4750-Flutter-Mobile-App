import 'package:cs4750_mobileapp/Menu_Bars/Friends_Screen.dart';
import 'package:cs4750_mobileapp/Menu_Bars/QRScan_Screen.dart';
import 'package:cs4750_mobileapp/Menu_Bars/Settings.dart';
import 'package:cs4750_mobileapp/constants/color_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cs4750_mobileapp/Menu_Bars/user_profile.dart';
import 'package:cs4750_mobileapp/Menu_Bars/user_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserProfilePage extends StatefulWidget {

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int _selectedIndex = 0;
  var userProfile ;
  var profilePic;
  var username;
  var location;
  var description;

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
            profilePic = userProfile["profilePic"];
            location = userProfile["location"];
            description = userProfile["description"];
          });
        }).catchError((error) {
          print("Failed to retrieve user's information");
        }
        );
      }
    });

    super.initState();
  }

  static var _widgetOptions = <Widget>[
    HomeScreen(),
    UsersCardsPage(),
    QRScanPage(),
    FriendsPage(),
    SettingsPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                profilePic == null ? "https://img.redbull.com/images/c_limit,w_1500,h_1000,f_auto,q_auto/redbullcom/2020/12/16/c61kpj1fxidgnwiqgz2h/faker-t1-main" : profilePic
            ),
            //onPressed: () {},
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                size: 27,
              ),
              onPressed: () {})
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.database),label: "Collection"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.qrcode),label: "QRScan"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userFriends),label: "Friends"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cog),label: "Settings"),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            }
            );
          }
      ),
    );
  }
}