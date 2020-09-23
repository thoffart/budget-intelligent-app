import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String nome;
  @HiveField(2)
  final String sobrenome;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String authToken;
  @HiveField(5)
  final List<dynamic> roles;
  @HiveField(6)
  final Map<String, dynamic> cadastroInteressado;
  

  User(this.id,  this.nome, this.sobrenome, this.email, this.authToken, this.roles, this.cadastroInteressado);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        sobrenome = json['sobrenome'] ?? '',
        email = json['email'],
        authToken = json['auth_token'],
        roles = json['roles'],
        cadastroInteressado = Map<String, dynamic>.from(json['cadastroInteressado'] ?? {});

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'auth_token': authToken,
      'roles': roles,
      'cadastroInteressado': cadastroInteressado,
    };

  @override
  List<Object> get props => [id, nome, sobrenome, email, authToken, roles, cadastroInteressado];

}
