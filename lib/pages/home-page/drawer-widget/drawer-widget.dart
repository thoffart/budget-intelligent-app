
import 'package:tcc_app/models/user.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
    this.user,
    this.logoutAction,
  }) : super(key: key);
  final User user;
  final Function logoutAction;
  

/*   Widget _createDrawerItemImage(String text, String image, GestureTapCallback onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
           Image.asset(image, width: 32),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  } */
  
  Widget _createDrawerItemIcon(String text, IconData icon, GestureTapCallback onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Colors.red, size: 32,),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple[300], Colors.purple[900]]
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 4),
                Text(user.nome, style: TextStyle(color: Colors.white),),
                SizedBox(height: 4),
                Text(user.email, style: TextStyle(color: Colors.white),),
              ],
            )
          ),
          _createDrawerItemIcon('Sair', Icons.exit_to_app, logoutAction)
        ],
      ),
    );
  }
}