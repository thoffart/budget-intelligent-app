import 'package:tcc_app/redux/user/user-actions.dart';
import 'package:tcc_app/redux/user/user-state.dart';
import 'package:redux/redux.dart';

final userReducers = combineReducers<UserState>([
  TypedReducer<UserState, UpdateUserSuccess>(_updateUserSuccess),
  TypedReducer<UserState, UpdateUser>(_updateUser),
]);

UserState _updateUser(UserState state, UpdateUser action) => state;

UserState _updateUserSuccess(UserState state, UpdateUserSuccess action) => state.copyWith(user: action.user);