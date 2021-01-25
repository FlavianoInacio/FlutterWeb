import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/util/app_colors.dart';
import 'package:myapp/util/app_model.dart';
import 'package:provider/provider.dart';

class Navegacao extends StatefulWidget {
  @override
  _NavegacaoState createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context, listen: true);
    List<PageInfo> pageInfos = app.pages;
    return ListView.builder(
        itemCount: pageInfos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          PageInfo info = pageInfos[index];
          return InkWell(
            onTap: () => _oncliCkNavegacao(index),
            child: Row(
              children: [
                Icon(
                  info.titulo == "Home"
                      ? FontAwesomeIcons.home
                      : FontAwesomeIcons.chevronRight,
                  color: AppColors.blue,
                ),
                Text(
                  info.titulo,
                  style: TextStyle(color: AppColors.blue),
                )
              ],
            ),
          );
        });
  }

  void _oncliCkNavegacao(int index) {
    AppModel app = Provider.of<AppModel>(context, listen: false);
    if(index==0){
      app.clearAll();
    }
    else{
      app.clearTo(index);
    }
  }
}
