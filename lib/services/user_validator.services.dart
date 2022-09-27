class UserValidator {
  static String? validarNome(String nome) {
    if (nome.isEmpty) return 'Nome é obrigatório';
    if (nome.length < 4) return 'Nome inválido';

    return null;
  }

  static String? validarEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern.toString());

    if (email.isEmpty) return 'E-mail é obrigatório';
    if (!regex.hasMatch(email)) return 'E-mail inválido';

    return null;
  }

  static String? validarSenha(String senha) {
    if (senha.isEmpty) return 'Senha é obrigatória';
    if (senha.length < 6) return 'Senha precisa ter mais de 6 caracteres';

    return null;
  }

  static String? validarConfirmarSenha(String confirmacaoSenha, String senha) {
    if (confirmacaoSenha.isEmpty) return 'Senha é obrigatória';
    if (confirmacaoSenha != senha) return 'As senhas estão diferentes';

    return null;
  }
}