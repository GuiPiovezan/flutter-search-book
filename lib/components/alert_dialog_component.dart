import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark_ligth_theme.theme.dart';

// class AlertDialog extends StatelessWidget {
//   const AlertDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return showDialog(context: context, builder: () => AlertDialog());
//   }
// }

AlertDialog showAlertDialog(BuildContext context, String message) =>
    AlertDialog(
      title: Text(
        'Atenção',
        style: TextStyle(fontSize: fontSize = 22.0),
      ),
      content: Text(
        message,
        style: TextStyle(fontSize: fontSize = 22.0),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: TextStyle(fontSize: fontSize = 22.0),
          ),
        ),
      ],
    );
