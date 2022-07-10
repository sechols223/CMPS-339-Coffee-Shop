// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously, avoid_print, file_names

import 'package:flutter_coffee/Screens/Sign_in.dart';
import 'package:flutter_coffee/Service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee/entities/get_it.dart';
import 'package:flutter_coffee/widgets/constants.dart';
import 'package:flutter_coffee/widgets/custom_text_button.dart';
import 'package:flutter_coffee/widgets/form_title_and_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String username;
  String firstname;
  String lastname;
  String address;
  String password;

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final authService = getIt<IAuthService>();

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
            color: Colors.white,
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
                      color: Colors.green.withOpacity(0.5),
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
                          onChanged: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              username = value;
                            });
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
                          onChanged: (value) {
                            setState(() {
                              firstname = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              firstname = value;
                            });
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
                          onChanged: (value) {
                            setState(() {
                              lastname = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              lastname = value;
                            });
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
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              address = value;
                            });
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
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomTextButton(
                            text: "Sign Up",
                            onTap: () async {
                              if (formKey.currentState.validate()) {
                                print(username);
                                print(firstname);
                                print(password);
                                await authService.signUp(
                                  username: username,
                                  firstname: firstname,
                                  lastname: lastname,
                                  address: address,
                                  password: password,
                                );
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SignInScreen();
                                  },
                                ));
                              } else {
                                print("not good");
                              }
                            }),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account ? "),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SignInScreen();
                                  },
                                ));
                              },
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.montserrat(
                                  color: Colors.blue,
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
