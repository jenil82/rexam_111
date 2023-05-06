import 'dart:convert';
import 'package:http/http.dart' as http;

import '../screen/home/model/api_model.dart';

class ApiHelper {
  Future<apiModel?> coronaApiCall(String train) async {
    String apiLink = "https://rapidapi.com/navii/api/railway-trains-${train}/";
    var response = await http.get(Uri.parse(apiLink), headers: {
      "content-type": "application/json",
      "X-RapidAPI-Key": "2ec5469b06msh2197869a39425dbp1720d4jsnc70ff410f626",
      "X-RapidAPI-Host": "trains.p.rapidapi.com",
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      apiModel homeModal = apiModel.fromJson(json);

      return homeModal;
    }
    return null;
  }
}