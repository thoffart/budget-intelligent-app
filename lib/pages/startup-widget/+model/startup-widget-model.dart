import 'package:equatable/equatable.dart';
import 'package:tcc_app/app-state.dart';
import 'package:redux/redux.dart';

class StartupWidgetModel extends Equatable {

  StartupWidgetModel();


  static StartupWidgetModel fromStore(Store<AppState> store) =>
    StartupWidgetModel(
      
    );

  @override
  List<Object> get props => [];
  
}
