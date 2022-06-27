// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_coffee/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  User user = User("", "", "", "", "");
  String url = '/register'; //springboot for Register
  Future save() async {
    var res = await http.post(url,
        headers: {'Context-Type': 'application/json'},
        body: json.encode({
          'firstname': user.firstname,
          'lastname': user.lastname,
          'username': user.username,
          'address': user.address,
          'password': user.password
        }));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  height: 800,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('lib/images/login.jpg'),
                    fit: BoxFit.cover,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Register",
                            style: GoogleFonts.habibi(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User",
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller:
                              TextEditingController(text: user.username),
                          onChanged: (val) {
                            user.username = val;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Username can't be empty";
                            }

                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 10, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Colors.white,
                        ),
                        //firstname
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "First Name",
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller:
                              TextEditingController(text: user.firstname),
                          onChanged: (val) {
                            user.firstname = val;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "First name can't be empty";
                            }

                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 10, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Colors.white,
                        ),
                        // last name
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Last Name",
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller:
                              TextEditingController(text: user.lastname),
                          onChanged: (val) {
                            user.lastname = val;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Last name can't be empty";
                            }

                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 10, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Colors.white,
                        ),
                        //address
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address",
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: user.address),
                          onChanged: (val) {
                            user.address = val;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Address can't be empty";
                            }

                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 10, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Colors.white,
                        ),
                        //password
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller:
                              TextEditingController(text: user.password),
                          onChanged: (val) {
                            user.password = val;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Password can't be empty";
                            }

                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 10, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In Here",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 90,
                  width: 90,
                  child: FlatButton(
                    color: Colors.brown,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        save();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
