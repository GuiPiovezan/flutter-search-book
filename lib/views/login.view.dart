import 'package:flutter/material.dart';
import 'package:flutter_search_book/components/alert_dialog_component.dart';
import 'package:flutter_search_book/components/elevated_button_customn.component.dart';
import 'package:flutter_search_book/components/text_form_input_customn.component.dart';
import 'package:flutter_search_book/services/authentication.services.dart';
import 'package:flutter_search_book/services/form.services.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  var authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    var formService = FormService(formKey: _formKey);
    String email = '', password = '';

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/images/icon_logo.png'),
              TextFormInputCustomn(
                labelText: 'E-mail',
                prefixIcon: Icons.person_outlined,
                onSaved: (value) => email = value!,
              ),
              TextFormInputCustomn(
                labelText: 'Senha',
                onSaved: (value) => password = value!,
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                isTextInputSecret: true,
              ),
              ElevatedButtonCustomn(
                textButton: 'Login',
                onPressed: () async {
                  if (formService.validateForm()) {
                    formService.saveForm();
                    try {
                      await authenticationService.login(email, password);
                    } on AuthenticationException catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) => showAlertDialog(context, e.message));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
