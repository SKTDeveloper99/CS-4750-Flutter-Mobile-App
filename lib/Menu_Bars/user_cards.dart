import 'package:flutter/material.dart';

class UsersCardsPage extends StatelessWidget {
  const UsersCardsPage({Key? key}) : super(key: key);

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