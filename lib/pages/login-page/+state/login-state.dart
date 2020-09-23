import 'package:meta/meta.dart';

@immutable
class LoginState{

  final bool hasError;
  final String errorMessage;
  final bool obscuredText;
  final bool isLogging;

  LoginState({
    @required this.hasError,
    @required this.errorMessage,
    @required this.obscuredText,
    @required this.isLogging,
  });

  factory LoginState.initial(){
    return LoginState(
      hasError: false,
      errorMessage: '',
      obscuredText: true,
      isLogging: false,
    );
  }

  LoginState copyWith({
    bool hasError,
    String errorMessage,
    bool obscuredText,
    bool isLogging,
  }){
    return LoginState(
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      obscuredText: obscuredText ?? this.obscuredText,
      isLogging: isLogging ?? this.isLogging,
    );
  }
}