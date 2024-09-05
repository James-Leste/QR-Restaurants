import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/order_model.dart';
import 'package:flutter_test_project/models/user_repository.dart';

import 'package:flutter_test_project/pages/home_page.dart';
import 'package:flutter_test_project/pages/authentication/login_or_register_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  //UserRepository userRepository = UserRepository.instance();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserRepository.instance())
      ],
      child: Consumer<UserRepository>(
          builder: (context, UserRepository user, child) {
        switch (user.status) {
          case Status.Unauthenticated:
            return LoginOrRegisterPage();
          case Status.Authenticated:
            return Scaffold(
              body: MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (context) => OrderModel.newOrder())
                ],
                child: HomePage(),
              ),
            );
          case Status.Authenticating:
            return LoginOrRegisterPage();
          case Status.Uninitialized:
            return LoginOrRegisterPage();
        }
      }),
    );
    // return Scaffold(
    //   body: StreamBuilder<User?>(
    //       stream: FirebaseAuth.instance.authStateChanges(),
    //       builder: (context, snapshot) {
    //         // user is logged in
    //         if (snapshot.hasData) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //         create: (context) => OrderModel.newOrder())
    //   ],
    //   child: HomePage(),
    // );
    //           //return HomePage();
    //         }
    //         // user not logged in
    //         else {
    //           return LoginOrRegisterPage();
    //         }
    //       }),
    // );
  }
}

class Waiting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Waiting for authentication'),
      ),
    );
  }
}
