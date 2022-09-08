import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark_ligth_theme.theme.dart';

class ElevatedButtonCustomn extends StatelessWidget {
  final String? textButton;

  const ElevatedButtonCustomn({Key? key, required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 14.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: DarkEnumColorsTheme.colorPurple.value,
          fixedSize: Size(MediaQuery.of(context).size.width, 50.0),
          textStyle: TextStyle(fontSize: fontSize),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text('$textButton'),
      ),
    );
  }
}
