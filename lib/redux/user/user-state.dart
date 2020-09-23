import 'package:meta/meta.dart';
import 'package:tcc_app/models/user.dart';

@immutable
class UserState{

  final User user;

  UserState({
    @required this.user,
  });

  factory UserState.initial(){
    return UserState(
      user: null,
    );
  }

  UserState copyWith({
    User user,
  }){
    return UserState(
      user: user ?? this.user,
    );
  }
}
