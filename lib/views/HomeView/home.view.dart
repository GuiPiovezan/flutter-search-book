import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark_ligth_theme.theme.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Seja bem-vindo, desenvolvedor!' + _auth.currentUser.toString(),
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.camera_alt,
        ),
      ),
    );
  }
}
