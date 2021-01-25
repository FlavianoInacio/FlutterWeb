import 'package:flutter/material.dart';

import 'package:myapp/instancias/carro.dart';
import 'package:myapp/util/app_colors.dart';
import 'package:myapp/util/app_model.dart';
import 'package:provider/provider.dart';

class CarroDetalhe extends StatefulWidget {
  Carro carro;
  CarroDetalhe({
    this.carro,
  });

  @override
  _CarroDetalheState createState() => _CarroDetalheState();
}

class _CarroDetalheState extends State<CarroDetalhe> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(widget.carro.urlFoto),
          Text(widget.carro.nome??"", style: TextStyle(fontSize: 22, color: AppColors.blue),),
          RaisedButton(
            child: Text("Voltar"),
            onPressed: () {
            _onclClickVoltar();
          }, )
        ],
      ),
    );
  }

  void _onclClickVoltar() {
    AppModel app = Provider.of<AppModel>(context, listen: false);
    app.pop();
  }
}
