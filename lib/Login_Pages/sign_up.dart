import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: SingleChildScrollView (
          child: Column (
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text (
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                    'assets/RNG_2021_Summer.jpg'
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 35, right: 35, top: 16, bottom: 10),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  width: 200,
                  height: 40,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.red),
                      ),
                      child: Text('Login'),
                      onPressed: () {

                      }
                  ),
                ),
              ]
          ),
        ),
        ),
      );
  }
}