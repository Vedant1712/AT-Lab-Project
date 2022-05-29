import 'package:findyourcure/screens/welcome.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class RegistrationScreen extends StatefulWidget {

  static const String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  void signUp(String email, String password) async {
    if(_formKey.currentState!.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
          Fluttertoast.showToast(msg: "Registration Successful"),
          _firestore.collection('userData').doc(_auth.currentUser!.uid).set({'fullname': fname.text, 'email': emailController.text, 'height': heightController.text, 'weight': weightController.text, 'age': ageController.text, 'bloodGrp': bloodgrpController.text}),
          Navigator.pushNamed(context, WelcomeScreen.id),
          fname.clear(),
          emailController.clear(),
          passwordController.clear(),
          confirmPasswordController.clear(),
          heightController.clear(),
          weightController.clear(),
          ageController.clear(),
          bloodgrpController.clear(),
          emailController.selection = TextSelection.fromPosition(TextPosition(offset: emailController.text.length))
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMssg = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMssg = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMssg = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMssg = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMssg = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMssg = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMssg = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMssg!);
        print(error.code);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController fname = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bloodgrpController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMssg;

  @override
  void dispose() {
    fname.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registation Screen',
        ),
        backgroundColor: Color(0xff846db6),
      ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image.asset('images/pngegg.png', color: Color(0xff846db6)),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          cursorColor: Color(0xff846db6),
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "Name cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            fname.text = value!;
                          },

                          autofocus: false,
                          controller: fname,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400
                            ),
                            prefixIcon: Icon(Icons.account_circle_sharp, color: Color(0xff846db6)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          cursorColor: Color(0xff846db6),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "Please enter some text";
                            }
                            if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },

                          autofocus: false,
                          controller: emailController,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400
                              ),
                              prefixIcon: Icon(Icons.mail, color: Color(0xff846db6)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff846db6))
                              ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          cursorColor: Color(0xff846db6),
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if(value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if(!regex.hasMatch(value)) {
                              return ("Enter valid password(Min. 6 Characters");
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          autofocus: false,
                          obscureText: true,
                          controller: passwordController,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400
                              ),
                              prefixIcon: Icon(Icons.vpn_key, color: Color(0xff846db6)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff846db6))
                              ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          cursorColor: Color(0xff846db6),
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            if(passwordController.text != confirmPasswordController.text) {
                              return "Password don't match";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            confirmPasswordController.text = value!;
                          },
                          autofocus: false,
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400
                              ),
                              prefixIcon: Icon(Icons.vpn_key, color: Color(0xff846db6)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff846db6))
                              ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Color(0xff846db6),
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            heightController.text = value!;
                          },

                          autofocus: false,
                          controller: heightController,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                            hintText: "Enter height in cm",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400
                            ),
                            prefixIcon: Icon(Icons.height, color: Color(0xff846db6)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Color(0xff846db6),
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            weightController.text = value!;
                          },

                          autofocus: false,
                          controller: weightController,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                            hintText: "Enter weight in kg",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400
                            ),
                            prefixIcon: Icon(Icons.monitor_weight, color: Color(0xff846db6)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Color(0xff846db6),
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            ageController.text = value!;
                          },

                          autofocus: false,
                          controller: ageController,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                            hintText: "Enter Your Age",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400
                            ),
                            prefixIcon: Icon(Icons.calendar_today, color: Color(0xff846db6)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          cursorColor: Color(0xff846db6),
                          style: TextStyle(color: Color(0xff846db6)),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            bloodgrpController.text = value!;
                          },

                          autofocus: false,
                          controller: bloodgrpController,
                          decoration: kRegTextFormFieldDecoration.copyWith(
                            hintText: "Enter Your Blood Group",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400
                            ),
                            prefixIcon: Icon(Icons.bloodtype_rounded, color: Color(0xff846db6)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff846db6), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                            ),
                          )
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Buttons(
                        text: 'Register',
                        textColor: Colors.white,
                        color: Color(0xff846db6),
                        callback: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          signUp(emailController.text, passwordController.text);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
