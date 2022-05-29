import 'package:findyourcure/screens/disease.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../network.dart';
var result;
var ids = [];
TextEditingController yearofBirth = new TextEditingController();
var genderRadioBtnVal = "";

List list = [];
List<bool> value = [false, false, false, false, false, false, false, false, false,
  false, false, false, false, false, false, false, false, false,
  false, false, false, false, false, false, false, false, false,
  false, false, false, false, false, false, false, false, false,
  false, false, false, false, false, false, false, false, false,
  false, false, false, false, false, false, false, false, false,
  false, false, false, false, false, false, false, false, false];
var i = 0;

class Symptoms extends StatefulWidget {

  static const String id = "symptoms_screen";

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {

  @override
  void initState() {
    super.initState();
    showSymptoms();
  }

  void showSymptoms() async {
     result = await Network('https://sandbox-healthservice.priaid.ch/symptoms?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InZlZGFudGdhbWluZzE3MDEyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTA1ODMiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjItMDQtMTgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTY1MDkyMjQ2OSwibmJmIjoxNjUwOTE1MjY5fQ.FK_HuuwU8QT9IpVv5jjQOCtnyYJ2zm-tmRKfdD8x7vE&format=json&language=en-gb').get();
     print(result);
     setState(() {
       for(var i in result) {
         list.add(i);
       }
     });
  }

  void _handleGenderChange(String? value) {
    setState(() {
      genderRadioBtnVal = value!;
    });
  }

  void callback(List ids) {
    setState(() {
      for(var i = 0; i < ids.length; i++) {
        value[ids[i]] = false;
      }
      ids = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Symptoms'),
        backgroundColor: Color(0xff846db6),
      ),
      backgroundColor: Color(0xffeae4f2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget> [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Gender',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        activeColor: Color(0xff846db6),
                        value: "male",
                        groupValue: genderRadioBtnVal,
                        onChanged: _handleGenderChange,
                      ),
                      Text("male",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        activeColor: Color(0xff846db6),
                        value: "female",
                        groupValue: genderRadioBtnVal,
                        onChanged: _handleGenderChange,
                      ),
                      Text("female",
                        style: TextStyle(
                            fontSize: 20.0
                        ),),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    Fluttertoast.showToast(msg: 'This field cannot be empty');
                  }
                },
                onSaved: (value) {
                  yearofBirth.text = value!;
                },
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff846db6)
                ),
                cursorColor: Color(0xff846db6),
                autofocus: false,
                controller: yearofBirth,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Year of Birth',
                  labelStyle: TextStyle(
                    color: Color(0xff846db6)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff846db6))
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff846db6))
                  ),
                  hintText: 'Enter year of birth',
                  hintStyle: TextStyle(
                    fontSize: 20.0
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Choose Symptoms',
                style: TextStyle(
                  fontSize: 25.0
                ),
              ),
            ),
            for(int i = 0; i < list.length; i++)
              Container(
                color: Color(0xffeae4f2),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CheckboxListTile(
                    activeColor: Color(0xff846db6),
                    title: Text(
                      list[i]["Name"],
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    value: value[i],
                    onChanged: (newvalue) {
                      setState(() {
                        value[i] = newvalue!;
                      });
                    },
                  ),
                ),
              ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: Material(
                elevation: 5.0,
                color: Color(0xff846db6),
                borderRadius: BorderRadius.circular(5.0),
                child: MaterialButton(
                  onPressed: () {
                    for(int i = 0; i < value.length; i++) {
                      if(value[i] == true) {
                        ids.add(list[i]["ID"]);
                      }
                    }
                    print(ids);
                    print(yearofBirth.text);
                    print(genderRadioBtnVal);
                    Navigator.pushNamed(context, Disease.id);
                  },
                  child: Text(
                    'Diagnosis',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
