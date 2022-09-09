import 'package:flutter/material.dart';
import 'package:flutter_search_book/services/authentication.services.dart';
import 'package:flutter_search_book/theme/dark.theme.dart';
import 'package:flutter_search_book/views/home.view.dart';
import 'package:flutter_search_book/views/login.view.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      routes: {
        '/': (context) => LoginView(),
        '/home': (context) => const HomeView(),
      },
      initialRoute: auth.userIsLogaded() == null ? '/' : '/home',
      debugShowCheckedModeBanner: false,
    );
  }
}
