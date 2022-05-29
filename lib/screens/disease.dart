import 'package:findyourcure/network.dart';
import 'package:flutter/material.dart';
import 'package:findyourcure/screens/symptoms.dart';
import 'package:url_launcher/url_launcher.dart';

List name = [];

class Disease extends StatefulWidget {

  static const String id = "disease_screen";
  const Disease({Key? key}) : super(key: key);

  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {

  @override
  void initState() {
    super.initState();
    getDiagnosis();
  }

  void getDiagnosis() async {
    result = await Network('https://sandbox-healthservice.priaid.ch/diagnosis?symptoms=$ids&gender=$genderRadioBtnVal&year_of_birth=${yearofBirth.text}&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InZlZGFudGdhbWluZzE3MDEyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTA1ODMiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjItMDQtMTgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTY1MDkyMjU0OSwibmJmIjoxNjUwOTE1MzQ5fQ.TD9WyXlsjJJ86Ar5mwXzRsyYv8s-FYkjBCHDGfDLh54&format=json&language=en-gb').diag();
    print(result);
    setState(() {
      for(var i in result) {
        if(i["Issue"]["Accuracy"] >= 75) {
          name.add(i["Issue"]["Name"]);
        }
      }
      ids = [];
    });
  }

  void _launchURL(String disease) async {
    var url = 'https://www.google.com/search?q=$disease&ie=UTF-8';
    if(!await launch(url)) {
      throw 'Could not launch';
    }
  }

  void findDoctors(String disease) async {
    var url = 'https://www.google.com/search?q=$disease+specialist+near+me&ie=UTF-8';
    if(!await launch(url)) {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Possible Outcome'),
    backgroundColor: Color(0xff846db6),
    ),
      backgroundColor: Color(0xffeae4f2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: ListView(
          children: <Widget>[
            for(var i = 0; i < name.length; i++)
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name[i],
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Material(
                          color: Color(0xff846db6),
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () => _launchURL(name[i]),
                            child: Text(
                              'Find out more',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                          color: Color(0xff846db6),
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () => findDoctors(name[i]),
                            child: Text(
                              'Find Doctors Near Me',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: 20.0,
              )
          ],
        ),
      )
    );
  }
}
