import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../components/my_inputField.dart';
import '../components/my_button.dart';
import '../components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signin() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print(e.code);
      failedMessage(e.code);
    }
  }

  void failedMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: Icon(Icons.error),
            title: Text(message),
          );
        });
  }

  void printMessage() {
    print("other");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Column(
                    children: [
                      const Icon(Icons.lock, size: 100),
                      const SizedBox(height: 50),
                      Text(
                        "Sign in with an existing account",
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
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
                          Text('Forget password?',
                              style: TextStyle(color: Colors.grey[700]))
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    MyButton(
                      onTap: signin,
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
                        onTap: widget.onTap,
                        child: Text('Register now',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ))
            ],
          ),
        )));
  }
}
