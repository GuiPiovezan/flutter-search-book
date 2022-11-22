import 'package:flutter/material.dart';
import 'package:flutter_search_book/core/theme/dark_ligth_theme.theme.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String? textButton;
  final VoidCallback? onPressed;

  const ElevatedButtonCustom({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 14.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 50.0),
          textStyle: TextStyle(fontSize: 22),
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 5, 121, 216),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text('$textButton'),
      ),
    );
  }
}
