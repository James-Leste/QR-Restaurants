import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/order_model.dart';

import 'package:flutter_test_project/pages/home_page.dart';
import 'package:flutter_test_project/pages/authentication/login_or_register_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (context) => OrderModel.newOrder())
                ],
                child: HomePage(),
              );
              //return HomePage();
            }
            // user not logged in
            else {
              return LoginOrRegisterPage();
            }
          }),
    );
  }
}
