
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../data/login_register/auth.dart';

class AuthViewModel  {
  final Auth _auth;

  AuthViewModel({required Auth auth})
      : _auth = auth;

  signInWithEmailAndPassword({
    required String password,
    required String email,
  }) =>
      _auth.signInWithEmailAndPassword(password: password, email: email);

  sigUpcreateUserWithEmailAndPassword({
    required String password,
    required String email,
  }) =>
      _auth.createUserWithEmailAndPassword(password: password, email: email);

  signOut() => _auth.signOut();

  Stream<User?> checkAuthState() => _auth.authState();

  currentData() => _auth.currentUser;
}