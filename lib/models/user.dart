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
  final String email;
  @HiveField(3)
  final String authToken;
  @HiveField(4)
  final List<dynamic> roles;
  

  User(this.id,  this.nome, this.email, this.authToken, this.roles);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        email = json['email'],
        authToken = json['auth_token'],
        roles = json['roles'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'nome': nome,
      'email': email,
      'auth_token': authToken,
      'roles': roles,
    };

  @override
  List<Object> get props => [id, nome, email, authToken, roles];

}
