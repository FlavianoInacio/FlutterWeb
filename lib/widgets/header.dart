import 'package:flutter/material.dart';
import 'package:myapp/instancias/usuario.dart';
import 'package:myapp/widgets/alert.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  GlobalKey _menuState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlutterLogo(
        size: 50,
      ),
      title: Text(
        "Flutter Werb",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      trailing: direitaHeader(),
    );
  }

  Row direitaHeader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(user.nome, style: TextStyle(color: Colors.white, fontSize: 18)),
        SizedBox(
          width: 20,
        ),
        InkWell(
          child: CircleAvatar(backgroundImage: NetworkImage(user.urlFoto)),
          onTap: () {
            dynamic state = _menuState.currentState;
          },
        ),
        PopupMenuButton(
            key: _menuState,
            padding: EdgeInsets.zero,
            onSelected: (value) {
              _onclickOptionMenu(context, value);
            },
            child: Icon(
              Icons.arrow_drop_down,
              size: 28,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return _getActions();
            })
      ],
    );
  }

  void _onclickOptionMenu(BuildContext context, value) {
    if(value=="meus_dados"){
      alert(context, "Meus Dados");
    }
    else if(value=="alterar_senha"){
      alert(context, "Alterar Senha");
    }
     else if(value=="logout"){
       alert(context, "Logout");
    }

  }

  _getActions() {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        child: Text("Meus Dados"),
        value: "meus_dados",
      ),
      PopupMenuItem<String>(
        child: Text("Alterar Senha"),
        value: "alterar_senha",
      ),
      PopupMenuItem<String>(
        child: Text("Logout"),
        value: "logout",
      ),
    ];
  }
}
