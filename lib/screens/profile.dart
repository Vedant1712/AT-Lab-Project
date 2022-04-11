import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  static const String id = "profile_page";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae4f2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/565204.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Vedant Vijesh Chaudhari',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Male, 20 years',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0
              ),
            )
          ],
        ),
      ),
    );
  }
}
