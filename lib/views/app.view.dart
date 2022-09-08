import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark.theme.dart';
import 'package:flutter_search_book/views/login.view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      routes: {
        '/': (context) => LoginView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
