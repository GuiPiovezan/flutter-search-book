// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_book/services/navigation.services.dart';

class AuthenticationException implements Exception {
  String message;
  AuthenticationException(this.message);
}

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final navigationService = NavigationService();

  login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationException('Usuário não encontrado.');
      }
      if (e.code == 'wrong-password') {
        throw AuthenticationException('Senha incorreta. Tente novamente');
      }
    }

    navigationService.redirectToHomeView(context);
  }

  userIsLogaded() {
    return _auth.currentUser;
  }
}
