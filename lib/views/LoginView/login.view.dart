import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_search_book/components/alert_dialog.component.dart';
import 'package:flutter_search_book/components/elevated_button_custom.component.dart';
import 'package:flutter_search_book/components/text_form_input_customn.component.dart';
import 'package:flutter_search_book/services/authentication.services.dart';
import 'package:flutter_search_book/services/form.services.dart';
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 33, 149, 243),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 33, 149, 243),
              Color.fromARGB(255, 33, 149, 243),
              Color.fromARGB(230, 33, 149, 243),
              Color.fromARGB(200, 33, 149, 243),
              Color.fromARGB(170, 33, 149, 243),
              Color.fromARGB(150, 33, 149, 243),
              Color.fromARGB(120, 33, 149, 243),
              Color.fromARGB(100, 33, 149, 243),
              Color.fromARGB(80, 33, 149, 243),
              Color.fromARGB(60, 33, 149, 243),
              Color.fromARGB(45, 33, 149, 243),
              Color.fromARGB(40, 33, 149, 243),
              Color.fromARGB(35, 33, 149, 243),
              Color.fromARGB(30, 33, 149, 243),
              Color.fromARGB(25, 33, 149, 243),
              Color.fromARGB(20, 33, 149, 243),
              Color.fromARGB(15, 33, 149, 243),
              Color.fromARGB(10, 33, 149, 243),
              Color.fromARGB(5, 33, 149, 243),
              Color.fromARGB(0, 33, 149, 243),
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'lib/images/icon_logo.png',
                        scale: 0.8,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextFormInputCustomn(
                        labelText: 'E-mail',
                        prefixIcon: Icons.person_outlined,
                        inputType: TextInputType.emailAddress,
                        controller: email,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'E-mail é obrigatório'),
                          EmailValidator(errorText: 'E-mail incorreto')
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextFormInputCustomn(
                        labelText: 'Senha',
                        controller: password,
                        prefixIcon: Icons.lock_outline,
                        obscureText: true,
                        isTextInputSecret: true,
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'Senha é obrigatória',
                          ),
                          MinLengthValidator(
                            6,
                            errorText: 'Senha deve ter no minímo 6 caracteres',
                          ),
                        ]),
                      ),
                    ),
                    (isLoading)
                        ? const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.amber,
                              ),
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: ElevatedButtonCustom(
                              textButton: 'Login',
                              onPressed: () {
                                _login(formService, context);
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(FormService formService, BuildContext context) async {
    setState(() => isLoading = true);
    if (formService.validateForm()) {
      formService.saveForm();
      try {
        await authenticationService.login(context, email.text, password.text);
      } on AuthenticationException catch (e) {
        setState(() => isLoading = false);
        showDialog(
          context: context,
          builder: (_) => showAlertDialog(context, e.message),
        );
      }
    }

    setState(() => isLoading = false);
  }
}
