import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/models/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/pages/home-page/+model/home-page-model.dart';
import 'package:tcc_app/pages/home-page/dashboard-page/dasboard-page.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-list-page.dart';
import 'package:tcc_app/pages/home-page/drawer-widget/drawer-widget.dart';
import 'package:tcc_app/redux/despesa/despesa-actions.dart';

class HomePage extends StatefulWidget  {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final List<TabData> _pages = <TabData>[
    TabData(
      index: 0,
      title: 'Dashboard',
      widget: DashboardPage(),
      icon: Icons.dashboard,
    ),
    TabData(
      index: 1,
      title: 'Despesas',
      widget: DespesaListPage(),
      icon: Icons.people,
    ),
  ];


  FFNavigationBar _bottomNavigationBar() {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBackgroundColor: Colors.purple,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.black,
      ),
      selectedIndex: _selectedPage,
      onSelectTab: (index) {
        setState(() {
          _selectedPage = index;
        });
      },
      items: [
        FFNavigationBarItem(
          iconData: Icons.dashboard,
          label: 'Dashboard',
        ),
        FFNavigationBarItem(
          iconData: Icons.monetization_on,
          label: 'Despesas',
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.purple),
      backgroundColor: Colors.white,
      title: Text('Budget Intelligent', style: TextStyle(color: Colors.purple),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageModel>(
      distinct: true,
      converter: HomePageModel.fromStore,
      onInit: (store) {
        if(store.state.despesaState.isFirstTimeAccess){
          store.dispatch(GetDespesaFirstTime());
        }
      },
      builder: (BuildContext context, homePageModel) {
        return Scaffold(
          key: Key('home-page'),
          appBar: _appBar(context),
          body: (homePageModel.isFirstTimeAccessDespesa) 
           ? Center(child: CircularProgressIndicator())
           : _pages[_selectedPage].widget,
          bottomNavigationBar: _bottomNavigationBar(),
          drawer: DrawerWidget(
            user: homePageModel.user,
            logoutAction: homePageModel.logoutAction,
          ),
        );
      }
    );
  }
}
