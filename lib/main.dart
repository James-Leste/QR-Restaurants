import 'package:flutter/cupertino.dart';

import 'package:flutter_test_project/pages/authentication/auth_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = UserObserver();
  await Supabase.initialize(
    url: 'https://snmrtfmbksmiogaoajmw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNubXJ0Zm1ia3NtaW9nYW9ham13Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjYwNjAxNDIsImV4cCI6MjA0MTYzNjE0Mn0.LqyDAqLzlT58y9OqFRlbt4rV_bM7f6X2Mi3o449W4_g',
  );
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
