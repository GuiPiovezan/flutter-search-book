import 'package:flutter/material.dart';
import 'package:flutter_search_book/components/elevated_button_customn.component.dart';
import 'package:flutter_search_book/components/text_form_input_customn.component.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/images/icon_logo.png'),
              TextFormInputCustomn(
                labelText: 'E-mail',
                prefixIcon: Icons.person_outlined,
              ),
              TextFormInputCustomn(
                labelText: 'Senha',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                isTextInputSecret: true,
              ),
              const ElevatedButtonCustomn(
                textButton: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
