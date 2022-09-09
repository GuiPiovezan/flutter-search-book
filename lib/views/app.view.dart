import 'package:flutter/material.dart';
import 'package:flutter_search_book/core/container.login.core.dart';
import 'package:flutter_search_book/services/authentication.services.dart';
import 'package:flutter_search_book/theme/dark.theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: const ContainerLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
