import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        children: [
          Image.asset(
              'assets/RNG_2021_Summer.jpg'
          ),
          Container(
          width: double.infinity,
            height: 230,
            child: Container(
              alignment: Alignment(0.0,2.5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://static.wikia.nocookie.net/rocky/images/f/f9/BalboaTitle1982.jpg/revision/latest?cb=20181108151110"
                ),
                radius: 70.0,
              ),
            ),
          ),
      ],
        ),
        );
  }
}
