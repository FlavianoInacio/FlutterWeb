import 'dart:async';
import 'dart:html';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool progress = false;
  String urlFoto = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                child: !progress?Text("Upload"):CircularProgressIndicator(),
                onPressed: () {
                  _onclickUpload();
                }),
            urlFoto==null?FlutterLogo():Image.network(urlFoto)
          ],
        ),
      ),
    );
  }

  void _onclickUpload()  {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      List<File> files = uploadInput.files;
      if (files.length > 0) {
        final file = files[0];
        final reader = new FileReader();
        reader.onLoadEnd.listen((event) async {
          setState(() {
            progress = true;
          });
          Object result = reader.result;
          String s = result;
          String base64 = s.substring(s.indexOf(",") + 1);
          String mimeType = s.substring(s.indexOf(":") + 1, s.indexOf(";"));
          String url = "https://carros-springboot.herokuapp.com/api/v1/upload";
          var params = {
            "fileName": file.name,
            "mimeType": mimeType,
            "base64": base64
          };
          String json = convert.json.encode(params);
          final headers = {
            "content-type": "application/json",
          };
          final response = await  http
              .post(url, body: json, headers: headers)
              .timeout(Duration(seconds: 120), onTimeout: onTimeOut);

           Map<String, dynamic> responseJson =  convert.json.decode(response.body);

          setState(() {
            progress = false;
            urlFoto = responseJson['url'];
          });
        });
        reader.readAsDataUrl(file);
      }
    });
  }

  FutureOr<http.Response> onTimeOut() {
    print("timeOut");
  }
}
