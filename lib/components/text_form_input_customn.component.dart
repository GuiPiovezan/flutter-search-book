import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark.theme.dart';
import 'package:flutter_search_book/theme/dark_class_theme.theme.dart';

class TextFormInputCustomn extends StatefulWidget {
  final String? labelText;
  final IconData? prefixIcon;
  bool isTextInputSecret;
  bool obscureText;

  TextFormInputCustomn(
      {Key? key,
      required this.labelText,
      required this.prefixIcon,
      this.obscureText = false,
      this.isTextInputSecret = false})
      : super(key: key);

  @override
  State<TextFormInputCustomn> createState() => _TextFormInputCustomnState();
}

class _TextFormInputCustomnState extends State<TextFormInputCustomn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        8.0,
        3.0,
        8.0,
        3.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              labelText: widget.labelText,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 16,
                  top: 16,
                ),
                child: Icon(
                  widget.prefixIcon,
                  size: 30.0,
                  color: DarkClassTheme().whiteColor,
                ),
              ),
              suffixIcon: widget.isTextInputSecret
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                      child: Icon(
                          widget.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: colorPurple),
                    )
                  : null,
            ),
            style: const TextStyle(
              fontSize: 22.0,
            ),
          ),
        ],
      ),
    );
  }
}
