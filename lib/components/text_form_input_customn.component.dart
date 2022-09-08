import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark_ligth_theme.theme.dart';

// ignore: must_be_immutable
class TextFormInputCustomn extends StatefulWidget {
  final String? labelText;
  final IconData? prefixIcon;
  bool isTextInputSecret;
  bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  TextFormInputCustomn(
      {Key? key,
      required this.labelText,
      required this.prefixIcon,
      this.obscureText = false,
      this.isTextInputSecret = false,
      this.onSaved,
      this.controller,
      this.validator})
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
            onSaved: widget.onSaved,
            controller: widget.controller,
            validator: widget.validator,
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
                  color: whiteColor,
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
                        color: whiteColor,
                      ),
                    )
                  : null,
            ),
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
