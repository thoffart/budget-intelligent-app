import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/models/user.dart';
import 'package:tcc_app/pages/login-page/+state/login-actions.dart';

@immutable
class HomePageModel{

  final Function() logoutAction;
  final User user;
  final bool isFirstTimeAccessDespesa;

  HomePageModel({
    this.logoutAction,
    this.user,
    this.isFirstTimeAccessDespesa,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is HomePageModel &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          isFirstTimeAccessDespesa == other.isFirstTimeAccessDespesa;
          
  @override
  int get hashCode => 
    user.hashCode ^
    isFirstTimeAccessDespesa.hashCode;

  static HomePageModel fromStore(Store<AppState> store) =>
    HomePageModel(
      logoutAction: () => store.dispatch(LogoutAction()),
      user: store.state.userState.user,
      isFirstTimeAccessDespesa: store.state.despesaState.isFirstTimeAccess,
    );

}