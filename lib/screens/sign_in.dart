import 'package:flutter_coffee/Service/auth_service.dart';
import 'package:flutter_coffee/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee/models/user_model.dart';
import 'package:flutter_coffee/screens/Sign_up.dart';
import 'package:flutter_coffee/widgets/constants.dart';
import 'package:flutter_coffee/widgets/custom_text_button.dart';
import 'package:flutter_coffee/widgets/form_title_and_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../entities/get_it.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String username;
  String password;

  TextEditingController usernameController = TextEditingController();
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
                          "Sign in",
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
                                UserModel user = (await authService.signIn(
                                  username: username,
                                  password: password,
                                )) as UserModel;
                                if (user != null)
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainScreen(),
                                      ));
                              } else {
                                print("Username/password incorrect");
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
                                    return SignUpScreen();
                                  },
                                ));
                              },
                              child: Text(
                                "Sign Up",
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
