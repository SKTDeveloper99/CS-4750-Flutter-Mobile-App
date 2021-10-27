import 'package:cs4750_mobileapp/Menu_Bars/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';
import 'sign_up.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: Image(
                image: AssetImage('assets/LPL_logo.png')
            ),
          ),
          Expanded(
            flex: 60,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => ForgotPassWordPage()),
                        );
                      },
                      child: new Text(
                          "Forgot Password?",
                        style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  width: 200,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: Colors.red),
                      ),
                      child: Text('Login'),
                      onPressed: () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text)
                            .then((value){
                          print("Successfully Logged in!");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserProfilePage()),
                          );
                        }).catchError((error){
                          print("Failed to log in!");
                          print(error.toString());
                        });
                      }
                  ),
                ),
                Container(
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpPage()),
                      );
                    },
                    child: new Text(
                      "Create new Account",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
         /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 20), child: Text('App logo:')),
              SignInButton.mini(
                buttonType: ButtonType.facebook,
                buttonSize: ButtonSize.small,
                onPressed: () {},
              ),
              SignInButton.mini(
                buttonType: ButtonType.google,
                buttonSize: ButtonSize.small,
                onPressed: () {},
              ),
              SignInButton.mini(
                buttonType: ButtonType.microsoft,
                buttonSize: ButtonSize.small,
                onPressed: () {},
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
