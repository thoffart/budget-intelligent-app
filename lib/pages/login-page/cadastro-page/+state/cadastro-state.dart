import 'package:meta/meta.dart';

@immutable
class CadastroState{

  final int pais;
  final bool obscureText;
  final bool emailEnabled;

  CadastroState({
    @required this.pais,
    @required this.obscureText,
    @required this.emailEnabled,
  });

  factory CadastroState.initial(){
    return CadastroState(
      pais: 0,
      obscureText: true,
      emailEnabled: false,
    );
  }

  CadastroState copyWith({
    int pais,
    bool obscureText,
    bool emailEnabled,
  }){
    return CadastroState(
        pais: pais ?? this.pais,
        obscureText: obscureText ?? this.obscureText,
        emailEnabled: emailEnabled ?? this.emailEnabled,
    );
  }
}