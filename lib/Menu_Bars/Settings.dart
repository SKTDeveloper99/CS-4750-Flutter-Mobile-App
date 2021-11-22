import 'package:cs4750_mobileapp/Login_Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          image: AssetImage('assets/LPL_logo.png'),
          fit: BoxFit.contain,
        )
            )
        ),
        Container(
          color: Color.fromRGBO(255, 255, 255, 0.7),
        ),
        ListTile(
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/LPL_logo.png'),
              ),
            ),
          ),
          title: const Text('Log Out'),
          dense: false,
        )
      ],
    )
    );
  }
}

