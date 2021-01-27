import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/pages/carro_page.dart';
import 'package:myapp/pages/default_page.dart';
import 'package:myapp/pages/upload_page.dart';
import 'package:myapp/pages/usuario_page.dart';
import 'package:myapp/util/app_colors.dart';
import 'package:myapp/util/app_model.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String selected;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _menuItem("Home", FontAwesomeIcons.home, DefaultPage()),
        _menuItem("Carros", FontAwesomeIcons.car, CarroPage()),
        _menuItem("Usuários", FontAwesomeIcons.user, UsuarioPage()),
        _menuItem("Upload", FontAwesomeIcons.upload, UploadPage())
      ],
    );
  }

  _menuItem(String texto, IconData icon, Widget page) {
    bool selecionado = texto == selected;
    return Material(
      color: selecionado ? Colors.blue[100] : Colors.transparent,
      child: InkWell(
        hoverColor: Colors.blue[100],
        splashColor: Colors.blue,
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.setPage(PageInfo(titulo: texto, page: page), replace: true);

          setState(() {
            this.selected = texto;
          });
        },
        child: ListTile(
          title: Text(
            texto,
            style: TextStyle(
              fontWeight: selecionado ? FontWeight.bold : FontWeight.normal,
              color: Theme.of(context).textTheme.bodyText2.color,
              fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily
            ),
          ),
          leading: Icon(
            icon,
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
        ),
      ),
    );
  }
}
