import 'package:http/http.dart' as http;
import 'package:myapp/instancias/carro.dart';
import 'dart:convert' as convert;

class CarroApi  {

  static Future<List<Carro>> getCarros() async{
    String url = "http://carros-springboot.herokuapp.com/api/v1/carros/";

    final response = await http.get(url);
    String json = response.body;
    List list =  convert.json.decode(json);
    List<Carro> carros = list.map<Carro>((map) {
      return Carro.fromJson(map);
    }).toList();
    return carros;

  }

}