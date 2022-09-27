import 'package:flutter/material.dart';
import 'package:flutter_search_book/FormController/register.controller.dart';
import 'package:flutter_search_book/Model/user.model.dart';
import 'package:flutter_search_book/components/app_bar_custom.component.dart';
import 'package:flutter_search_book/components/elevated_button_custom.component.dart';
import 'package:flutter_search_book/components/text_form_input_custom.component.dart';
import 'package:flutter_search_book/services/authentication.services.dart';
import 'package:flutter_search_book/services/user_validator.services.dart';
import 'package:flutter_search_book/theme/gradient_backgound.theme.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterControllerService controller = RegisterControllerService();

  AuthenticationService auth = AuthenticationService();

  bool isLoading = false;

  void save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      formKey.currentState!.save();
      try {
        UserModel model = UserModel(
          nome: controller.name!.text.trim(),
          uid: null,
        );

        await auth.register(
          controller.email!.text.trim(),
          controller.password!.text.trim(),
          model,
          context,
        );
      } on AuthenticationException catch (e) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: const AppBarCustom(
        title: "Cadastro",
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: listColors,
          ),
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                      child: CircleAvatar(
                        maxRadius: MediaQuery.of(context).size.width / 6,
                        minRadius: 30,
                        child: const Icon(Icons.person, size: 60),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextFormInputCustom(
                        controller: controller.name,
                        labelText: 'Nome',
                        validator: (value) => UserValidator.validarNome(value!),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextFormInputCustom(
                        controller: controller.email,
                        inputType: TextInputType.emailAddress,
                        labelText: 'E-mail',
                        validator: (value) => UserValidator.validarEmail(value!),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextFormInputCustom(
                        controller: controller.password,
                        labelText: 'Senha',
                        validator: (value) => UserValidator.validarSenha(value!),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextFormInputCustom(
                        controller: controller.confirmPassword,
                        labelText: 'Confirmar senha',
                        obscureText: true,
                        validator: (value) => UserValidator.validarConfirmarSenha(
                            value!, controller.password!.text),
                      ),
                    ),
                    (isLoading)
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: ElevatedButtonCustom(
                              textButton: 'Cadastrar',
                              onPressed: () {
                                save(context);
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
}
