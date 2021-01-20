import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/pages/carro_page.dart';
import 'package:myapp/pages/default_page.dart';
import 'package:myapp/pages/usuario_page.dart';
import 'package:myapp/util/app_model.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _menuItem("Home", FontAwesomeIcons.home, DefaultPage()),
        _menuItem("Carros", FontAwesomeIcons.car, CarroPage()),
        _menuItem("Usuários", FontAwesomeIcons.user, UsuarioPage()),
      ],
    );
  }

  _menuItem(String texto, IconData icon, Widget page) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.blue[100],
        splashColor: Colors.blue,
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.setPage(page);
        },
        child: ListTile(
          title: Text(texto),
          leading: Icon(icon),
        ),
      ),
    );
  }
}
