import 'package:meta/meta.dart';

@immutable
class StartupWidgetState {

  StartupWidgetState();

  factory StartupWidgetState.initial(){
    return StartupWidgetState(
    );
      
  }

  StartupWidgetState copyWith(){
    return StartupWidgetState();
  }
}
