import 'package:findyourcure/model/user.dart';
import 'package:findyourcure/screens/appbar_widget.dart';
import 'package:findyourcure/screens/profile_widget.dart';
import 'package:findyourcure/utils/user_preferences.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  static const String id = "profile_page";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
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

  buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  buildHeight(User user) => Container(
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
          user.height,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}

buildWeight(User user) => Container(
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
        user.weight,
        style: TextStyle(fontSize: 16, height: 1.4),
      ),
    ],
  ),
);

buildAge(User user) => Container(
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
        user.age,
        style: TextStyle(fontSize: 16, height: 1.4),
      ),
    ],
  ),
);

buildBloodGroup(User user) => Container(
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
        user.bloodGroup,
        style: TextStyle(fontSize: 16, height: 1.4),
      ),
    ],
  ),
);