
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


abstract class AuthBase {
  User? getCurrentUser();

  Future<User?> signIn(String email, String password);

  Future<User?> signUp(String email, String password);

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _auth = FirebaseAuth.instance;

  @override
  User? getCurrentUser() => _auth.currentUser;

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }

  @override
  Future<void> signOut() async => _auth.signOut();

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
