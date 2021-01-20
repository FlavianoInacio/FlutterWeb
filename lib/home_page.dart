import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/util/app_model.dart';
import 'package:myapp/util/constraints.dart';
import 'package:myapp/widgets/body.dart';
import 'package:myapp/widgets/header.dart';
import 'package:myapp/widgets/menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;
  bool get showDrower => size.width >= 600;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page(),
    );
  }

  _page() {
    return Column(
      children: [
        _header(),
        _body(),
      ],
    );
  }

  Container _body() {
    return Container(
        height: size.height - headerHeight,
        width: size.width,
        child: showDrower? Row(
          children: [
            _menu(),
            _direita(),
          ],
        ):Row(
          children: [
            _direita(),
          ],
        ),
      );
  }

  Container _header() {
    return Container(
        padding: EdgeInsets.all(16),
        width: size.width,
        height: headerHeight,
        color: Colors.blue[300],
        child:Header(),
      );
  }

  _menu() {
    return Container(
      width: menuWidth,
      color: Colors.grey[100],
      child: Menu(),

    );
  }

  _direita() {
    return Container(
      width: !showDrower? size.width: size.width-menuWidth,
      child: Body(),
    );
  }
}
