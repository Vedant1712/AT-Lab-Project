import 'package:findyourcure/screens/covid19.dart';
import 'package:findyourcure/screens/profile.dart';
import 'package:findyourcure/screens/records.dart';
import 'package:findyourcure/screens/symptoms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {

  static const String id = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void bookSlot() async {
    var url = 'https://www.cowin.gov.in/';
    if(!await launch(url)) {
      throw 'Could not launch';
    }
  }

  void healthMap() async {
    var url = 'https://www.healthmap.org/en/';
    if(!await launch(url)) {
      throw 'Could not launch';
    }
  }

  void consult() async {
    var url = 'https://www.google.com/search?q=doctors+near+me&ie=UTF-8';
    if(!await launch(url)) {
      throw 'Could not launch';
    }
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae4f2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xff846db6),
                      size: 40.0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ProfilePage.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color(0xff846db6),
                      size: 40.0,
                    ),
                    onPressed: () {
                      _auth.signOut();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Run Free Health Checkups',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Symptoms.id);
                },
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Catch signs early and become aware of your risk-level for various health conditions',
                                style: TextStyle(
                                  fontSize: 20.0
                                ),
                              ),
                            ),
                            Image.asset(
                              'images/pngeggh.png',
                              height: 100,
                              width: 100,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 230,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            color: Color(0xff846db6),
                          ),
                          child: Text(
                            'FREE Health Checkup',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                '24x7 Online Doctor Consultation',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: consult,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Talk to specialist doctor and get medical asssitance at just Rs 200.',
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              ),
                            ),
                            Image.asset(
                              'images/pngeggdoc.png',
                              height: 100,
                              width: 100,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 250,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            color: Color(0xff846db6),
                          ),
                          child: Text(
                            'Consult Now & Pay Later',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Save Medical Records',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Records.id);
                },
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Talk to specialist doctor and get medical asssitance at just Rs 200.',
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              ),
                            ),
                            Image.asset(
                              'images/docimg.png',
                              height: 100,
                              width: 100,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 250,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            color: Color(0xff846db6),
                          ),
                          child: Text(
                            'Uploads Records',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Check Vaccine Availability',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: bookSlot,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Get your slot for Covid Vaccination',
                                style: TextStyle(
                                    fontSize: 20.0,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 250,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Book Now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff846db6),
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xff846db6),
                        Colors.purple.shade300
                      ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Find Outbreaks Near You',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: healthMap,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                'Get alert for all diseases nearby',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 250,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Click Here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff846db6),
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xff846db6),
                          Colors.purple.shade300
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CovidScreen.id);
                },
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'COVID-19 Info',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 250,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Click Here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff846db6),
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xff846db6),
                          Colors.purple.shade300
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
