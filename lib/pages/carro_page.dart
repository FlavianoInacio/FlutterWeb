import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/api/carros_api.dart';
import 'package:myapp/instancias/carro.dart';
import 'package:myapp/pages/carro_detalhe.dart';
import 'package:myapp/util/app_colors.dart';
import 'package:myapp/util/app_model.dart';
import 'package:myapp/util/dart_size.dart';
import 'package:provider/provider.dart';

class CarroPage extends StatefulWidget {
  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Carro>>(
      future: CarroApi.getCarros(),
      builder: (context, snaptshot) {
        if (!snaptshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snaptshot.data;
        return _listView(carros);
      },
    ));
  }

  _listView(List<Carro> carros) {
    return GridView.builder(
      itemCount: carros.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5),
      itemBuilder: (contex, index) {
        Carro carro = carros[index];
        return LayoutBuilder(
          builder: ((context, constraints) {
            double fontSize =
                size(constraints.maxWidth * 0.08, min: 10, max: 22);
            return InkWell(
              onTap: () {
                _onClickCarro(carro);
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 300, maxHeight: 300),
                        child: Image(
                            image: carro.urlFoto != null
                                ? NetworkImage(carro.urlFoto)
                                : AssetImage(
                                    'assets/images/image-not-found.png'))),
                    Text(
                      carro.nome ?? "Não Informado",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: AppColors.blue
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  void _onClickCarro(Carro carro) {
    AppModel app = Provider.of<AppModel>(context, listen: false);
    app.setPage(PageInfo(titulo: carro.nome, page: CarroDetalhe(carro: carro,)));
  }
}
