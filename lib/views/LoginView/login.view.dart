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

  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var formService = FormService(formKey: _formKey);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(122, 0, 0, 0),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(1, 0.5),
                        ),
                      ],
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 7, 3),
                    child: Image.asset(
                      'lib/images/icon_logo.png',
                      scale: 0.6,
                    ),
                  ),
                ),
              ),
              TextFormInputCustomn(
                labelText: 'E-mail',
                prefixIcon: Icons.person_outlined,
                controller: email,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'E-mail é obrigatório'),
                  EmailValidator(errorText: 'E-mail incorreto')
                ]),
              ),
              TextFormInputCustomn(
                labelText: 'Senha',
                controller: password,
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
                        await _login(formService, context);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(FormService formService, BuildContext context) async {
    print(email.text);
    print(password.text);
    setState(() => isLoading = true);
    if (formService.validateForm()) {
      formService.saveForm();
      try {
        await authenticationService.login(context, email.text, password.text);
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
