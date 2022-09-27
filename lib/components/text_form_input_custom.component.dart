import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark_ligth_theme.theme.dart';

class TextFormInputCustom extends StatefulWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final bool? isTextInputSecret;
  final TextInputType? inputType;
  final bool? obscureText;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? placeholder;

  const TextFormInputCustom({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.isTextInputSecret = false,
    this.onSaved,
    this.controller,
    this.validator,
    this.placeholder,
    this.inputType,
  }) : super(key: key);

  @override
  State<TextFormInputCustom> createState() => _TextFormInputCustomState();
}

class _TextFormInputCustomState extends State<TextFormInputCustom> {
  bool obscureText = false;
  bool isTextInputSecret = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureText = widget.obscureText!;
    isTextInputSecret = widget.isTextInputSecret!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      controller: widget.controller,
      keyboardType: widget.inputType ?? TextInputType.text,
      validator: widget.validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        hintText: widget.placeholder ?? '',
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(234, 255, 255, 255),
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        labelText: widget.labelText,
        prefixIcon: Icon(
          widget.prefixIcon,
          size: 30.0,
          color: whiteColor,
        ),
        suffixIcon: isTextInputSecret
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: whiteColor,
                ),
              )
            : null,
        errorStyle: const TextStyle(fontSize: 16.0),
      ),
      style: const TextStyle(
        fontSize: 20.0,
      ),
    );
  }
}
