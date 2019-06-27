import 'package:http/http.dart' as http;
import 'dart:convert';

class Networker{

  Networker({this.uri});

  final String uri;

  Future getData() async {
    http.Response response = await http.get(this.uri);
    if (response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    }else{
      print(response.statusCode);
    }

  }

}