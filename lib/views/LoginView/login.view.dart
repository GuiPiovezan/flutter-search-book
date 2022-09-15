import 'package:flutter/material.dart';
import 'package:flutter_search_book/components/alert_dialog_component.dart';
import 'package:flutter_search_book/components/elevated_button_customn.component.dart';
import 'package:flutter_search_book/components/text_form_input_customn.component.dart';
import 'package:flutter_search_book/services/authentication.services.dart';
import 'package:flutter_search_book/services/form.services.dart';
import 'package:flutter_search_book/theme/dark.theme.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  var authenticationService = AuthenticationService();
  bool isLoading = false;

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
                validator: MultiValidator([
                  RequiredValidator(errorText: 'E-mail é obrigatório'),
                  EmailValidator(errorText: 'E-mail incorreto')
                ]),
              ),
              TextFormInputCustomn(
                labelText: 'Senha',
                onSaved: (value) => password = value!,
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                isTextInputSecret: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Senha é obrigatória'),
                  MinLengthValidator(6,
                      errorText: 'Senha deve ter no minímo 6 caracteres'),
                ]),
              ),
              (isLoading)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: colorPurple,
                        ),
                      ),
                    )
                  : ElevatedButtonCustomn(
                      textButton: 'Login',
                      onPressed: () async {
                        await _login(formService, email, password, context);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(FormService formService, String email, String password,
      BuildContext context) async {
    setState(() => isLoading = true);
    if (formService.validateForm()) {
      formService.saveForm();
      try {
        await authenticationService.login(context, email, password);
      } on AuthenticationException catch (e) {
        setState(() => isLoading = false);
        showDialog(
            context: context,
            builder: (_) => showAlertDialog(context, e.message));
      }
    }

    setState(() => isLoading = false);
  }
}
