import 'package:flutter/material.dart';
import 'package:flutter_search_book/views/HomeView/home.view.dart';

class NavigationService {
  redirectToHomeView(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => HomeView()),
      (route) => false,
    );
  }
}
