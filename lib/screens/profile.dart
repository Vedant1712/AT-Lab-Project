import 'package:findyourcure/model/user.dart';
import 'package:findyourcure/screens/appbar_widget.dart';
import 'package:findyourcure/screens/profile_widget.dart';
import 'package:findyourcure/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
var fullname = "";
var email = "";
var height = "";
var weight = "";
var age = "";
var bloodGrp = "";

class ProfilePage extends StatefulWidget {

  static const String id = "profile_page";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    var userdata = await _firestore.collection('userData').doc(_auth.currentUser!.uid).get();
    setState(() {
      fullname = userdata.data()!['fullname'].toString();
      email = userdata.data()!['email'].toString();
      height = userdata.data()!['height'].toString();
      weight = userdata.data()!['weight'].toString();
      age = userdata.data()!['age'].toString();
      bloodGrp = userdata.data()!['bloodGrp'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Color(0xffeae4f2),
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async{},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 48),
          buildHeight(user),
          const SizedBox(height: 40),
          buildWeight(user),
          const SizedBox(height: 40),
          buildAge(user),
          const SizedBox(height: 40),
          buildBloodGroup(user),
        ],
      ),
    );
  }

  buildName(user user) => Column(
    children: [
      Text(
        fullname,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  buildHeight(user user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Height',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          '$height cm',
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}

buildWeight(user user) => Container(
  padding: EdgeInsets.symmetric(horizontal: 48),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Weight',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text(
        '$weight kg',
        style: TextStyle(fontSize: 16, height: 1.4),
      ),
    ],
  ),
);

buildAge(user user) => Container(
  padding: EdgeInsets.symmetric(horizontal: 48),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Age',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text(
        age,
        style: TextStyle(fontSize: 16, height: 1.4),
      ),
    ],
  ),
);

buildBloodGroup(user user) => Container(
  padding: EdgeInsets.symmetric(horizontal: 48),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Blood Group',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text(
        bloodGrp,
        style: TextStyle(fontSize: 16, height: 1.4),
      ),
    ],
  ),
);