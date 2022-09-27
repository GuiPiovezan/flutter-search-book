import 'package:flutter/material.dart';

class RegisterControllerException implements Exception {
  String message;
  RegisterControllerException(this.message);
}

class RegisterControllerService extends TextEditingController {
  TextEditingController? name;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? confirmPassword;

  RegisterControllerService() {
    _registerControllerService();
  }

  _registerControllerService() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }
}