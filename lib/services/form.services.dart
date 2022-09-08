import 'package:flutter/cupertino.dart';

class FormService {
  final GlobalKey<FormState>? formKey;

  FormService({
    required this.formKey,
  });

  validateForm() {
    return formKey!.currentState!.validate();
  }

  saveForm() {
    return formKey!.currentState!.save();
  }
}
