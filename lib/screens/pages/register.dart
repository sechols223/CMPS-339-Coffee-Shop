import 'dart:convert';

import 'package:flutter_coffee/screens/pages/myhomepage.dart';
import 'package:flutter_coffee/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee/widgets/constants.dart';
import 'package:flutter_coffee/widgets/custom_text_button.dart';
import 'package:flutter_coffee/widgets/form_title_and_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  UserModel user = UserModel(
    "",
    "",
    "",
    "",
    "",
  );
  String url = "https://coffeeshop-staging.herokuapp.com/register";

  Future save(user) async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': user.username,
          'firstname': user.firstname,
          'lastname': user.lastname,
          'address': user.address,
          'password': user.password
        }));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            color: Colors.brown[200],
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 600,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: largestText,
                        ),
                        const SizedBox(height: 50),
                        FormTitleAndField(
                          title: "Username",
                          textEditingController: usernameController,
                          onChanged: (val) {
                            user.username = val;
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "First Name",
                          textEditingController: firstnameController,
                          onChanged: (val) {
                            user.firstname = val;
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "Last Name",
                          textEditingController: lastnameController,
                          onChanged: (val) {
                            user.lastname = val;
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "Address",
                          textEditingController: addressController,
                          onChanged: (val) {
                            user.address = val;
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "Password",
                          textEditingController: passwordController,
                          obscure: true,
                          onChanged: (val) {
                            user.password = val;
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text("Forgot Password?"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomTextButton(
                            text: "Register",
                            onTap: () async {
                              if (formKey.currentState.validate()) {
                                save(UserModel(
                                    usernameController.text,
                                    passwordController.text,
                                    firstnameController.text,
                                    lastnameController.text,
                                    addressController.text));
                              }
                            }),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account ? "),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context, MaterialPageRoute(
                                  builder: (context) {
                                    return MyHomePage();
                                  },
                                ));
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
