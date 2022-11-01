import 'package:flutter/material.dart';
import 'package:flutter_search_book/services/authentication.services.dart';
import 'package:flutter_search_book/views/HomeView/home.view.dart';
import 'package:flutter_search_book/views/LoginView/login.view.dart';

class ContainerLogin extends StatefulWidget {
  const ContainerLogin({Key? key}) : super(key: key);

  @override
  State<ContainerLogin> createState() => _ContainerLoginState();
}

class _ContainerLoginState extends State<ContainerLogin> {
  AuthenticationService auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    if (auth.userIsLogaded() != null){
      return HomeView();
    } else {
      return LoginView();
    }
  }
}
