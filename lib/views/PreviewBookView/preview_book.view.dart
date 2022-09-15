import 'package:flutter/material.dart';

class PreviewBookView extends StatelessWidget {
  String? textContext;

  PreviewBookView({super.key, required textContext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          textContext!,
        ),
      ),
    );
  }
}
