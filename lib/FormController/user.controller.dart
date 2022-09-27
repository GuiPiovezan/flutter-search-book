import 'package:flutter/material.dart';

class LoginControllerException implements Exception {
  String message;
  LoginControllerException(this.message);
}

class LoginControllerService extends TextEditingController {
  TextEditingController? email;
  TextEditingController? password;

  LoginControllerService() {
    _loginControllerService();
  }

  _loginControllerService() {
    email = TextEditingController();
    password = TextEditingController();
  }
}