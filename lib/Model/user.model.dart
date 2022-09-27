class UserModel {
  String? nome;
  String? uid;

  UserModel({
    required this.nome,
    required this.uid,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    uid = map['uid'];
  }
}