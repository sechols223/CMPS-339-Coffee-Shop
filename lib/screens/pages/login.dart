import 'dart:convert';

import 'package:flutter_coffee/models/user_model.dart';
import 'package:flutter_coffee/screens/pages/myhomepage.dart';
import 'package:flutter_coffee/screens/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee/widgets/constants.dart';
import 'package:flutter_coffee/widgets/custom_text_button.dart';
import 'package:flutter_coffee/widgets/form_title_and_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  UserModel user = UserModel(
    "",
    "",
    "",
    "",
    "",
  );
  String url = "https://coffeeshop-staging.herokuapp.com/login";

  Future save(UserModel) async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json
            .encode({'username': user.username, 'password': user.password}));
    print(res.body);
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
                      color: Colors.brown[400],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Sign in",
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
                            text: "Sign In",
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
                            Text("Don't have an account ? "),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Register();
                                  },
                                ));
                              },
                              child: Text(
                                "Sign Up",
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
