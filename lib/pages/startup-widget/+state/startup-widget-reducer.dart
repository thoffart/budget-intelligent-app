import 'package:tcc_app/pages/startup-widget/+state/startup-widget-actions.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-state.dart';
import 'package:redux/redux.dart';

final startupWidgetReducer = combineReducers<StartupWidgetState>([
  TypedReducer<StartupWidgetState,VerifyPreferences>(_verifyPreferences),
  TypedReducer<StartupWidgetState,DeletePreferences>(_deletePreferences),
  TypedReducer<StartupWidgetState,SavePreferences>(_savePreferences),
  TypedReducer<StartupWidgetState,InitializeHive>(_initializeHive),
]);

StartupWidgetState _verifyPreferences(StartupWidgetState state, VerifyPreferences action) => state;

StartupWidgetState _deletePreferences(StartupWidgetState state, DeletePreferences action) => state;

StartupWidgetState _savePreferences(StartupWidgetState state, SavePreferences action) => state;

StartupWidgetState _initializeHive(StartupWidgetState state, InitializeHive action) => state;
