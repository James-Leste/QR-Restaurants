import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/notification_card.dart';
import 'package:flutter_test_project/models/user_repository.dart';

import 'package:provider/provider.dart';

import '../../components/my_inputField.dart';
import '../../components/my_button.dart';
import '../../components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function interfaceSwitch;
  LoginPage({super.key, required this.interfaceSwitch});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void signin() async {
  //   showCupertinoDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  //   try {
  //     await _AuthService.signInWithEmailAndPassword(
  //         emailController.text, passwordController.text);
  //     Navigator.pop(context);
  //   } catch (e) {
  //     Navigator.pop(context);
  //     failedMessage(e.toString());
  //   }
  // }

  void failedMessage(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return NotificationCard(message: message, icon: Icons.error);
      },
      barrierDismissible: true,
    );
  }

  void printMessage() {
    print("other");
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.grey[300],
        child: Consumer<UserRepository>(builder: (context, user, child) {
          return SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.lock_person,
                          size: 100,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "Sign in with an existing account",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        ),
                      ],
                    )),
                // const SizedBox(
                //   height: 50,
                // ),

                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyInputField(
                        controller: emailController,
                        hintText: "Username",
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      MyInputField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Forgot password?',
                                style: TextStyle(color: Colors.grey[700]))
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                        onTap: () async {
                          // showCupertinoDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return const Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     });
                          log('Using Email ${emailController.text} to login');
                          bool result = await user.signIn(
                              emailController.text, passwordController.text);
                          if (!result) {
                            failedMessage("Error in login");
                          }
                        },
                        buttonLabel: 'Sign In',
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                                  thickness: 0.3, color: Colors.grey[400])),
                          Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Expanded(
                              child: Divider(
                                  thickness: 0.3, color: Colors.grey[400]))
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SquareTile(
                            imagePath: 'lib/images/google.png',
                            onTap: printMessage,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          SquareTile(
                            imagePath: 'lib/images/apple-logo.png',
                            onTap: printMessage,
                          )
                        ],
                      ),
                    ],
                  ),
                )),

                Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            widget.interfaceSwitch();
                          },
                          child: Text('Register now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ))
              ],
            ),
          ));
        }));
  }
}
