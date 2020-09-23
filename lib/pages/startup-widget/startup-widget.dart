import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/startup-widget/+model/startup-widget-model.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-actions.dart';

class StartupWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StartupWidgetModel>(
      converter: StartupWidgetModel.fromStore,
      distinct: true,
      onInit: (store) {
        store.dispatch(InitializeHive());
      },
      builder: (context, model) {
        return Container();
      },
    );
  }
}