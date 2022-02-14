import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';
import 'package:clima/Screens/loading_screen.dart';



class NetworkHelper {

  Uri url ;
  NetworkHelper(this.url);


  Future GetData() async {

    http.Response reponse = await http.get(url);
    if(reponse.statusCode == 200){
      String data = reponse.body;
      var decodedData  = jsonDecode(data);

      return decodedData;
    }

    else{
      print(reponse.statusCode);
    }
  }


}