import 'package:flutter/cupertino.dart';

import 'package:flutter_test_project/pages/authentication/auth_page.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = UserObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Namer App',
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
