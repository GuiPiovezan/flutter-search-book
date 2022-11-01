import 'package:flutter/material.dart';
import 'package:flutter_search_book/core/theme/dark_ligth_theme.theme.dart';

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
