import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository extends ChangeNotifier {
  final GoTrueClient _auth = Supabase.instance.client.auth;
  User? _user;
  Status _status = Status.Uninitialized;

  UserRepository() {
    _onAuthStateChanged(_auth.currentSession);
    _auth.onAuthStateChange.listen((data) {
      _onAuthStateChanged(data.session);
    });
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final response =
          await _auth.signInWithPassword(email: email, password: password);
      if (response.session != null) {
        _user = response.user;
        _status = Status.Authenticated;
        return true;
      } else {
        _status = Status.Unauthenticated;
        return false;
      }
    } on AuthException catch (e) {
      _status = Status.Unauthenticated;

      notifyListeners();
      log(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final response = await _auth.signUp(email: email, password: password);
      if (response.user != null) {
        _user = response.user;
        _status = Status.Authenticated;
        return true;
      } else {
        _status = Status.Unauthenticated;
        return false;
      }
    } on AuthException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      log(e.toString());
      return false;
    }
  }

  Future signOut() async {
    await _auth.signOut();

    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(Session? session) async {
    if (session == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = session.user;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Status get status => _status;
  User? get user => _user;
  String? get email => _user?.email.toString();
  // String? get displayName => _user?.userMetadata['name'].toString();
  // String? get phone => _user?..toString();
  // String? get photoUrl => _user?.photoURL.toString();
}
