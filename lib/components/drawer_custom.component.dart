import 'package:flutter/material.dart';
import 'package:flutter_search_book/services/authentication.services.dart';

class DrawerCustom extends StatefulWidget {

  const DrawerCustom({Key? key}) : super(key: key);

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  AuthenticationService auth = AuthenticationService();

  _logOut(context){
    auth.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 33, 150, 243),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Deslogar ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Icon(
                  Icons.logout_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
            onTap: () {
              _logOut(context);
            },
          ),
        ],
      ),
    );
  }
}