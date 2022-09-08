import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationException implements Exception {
  String message;
  AuthenticationException(this.message);
}

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationException('Usuário não encontrado.');
      }
      if (e.code == 'wrong-password') {
        throw AuthenticationException('Senha incorreta. Tente novamente');
      }
    }
  }
}
