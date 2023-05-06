import 'package:flutter/material.dart';

import '../../../utils/api_hilper.dart';
import '../model/api_model.dart';

class api_provider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  apiModel homeModal = apiModel();
  TextEditingController trainc = TextEditingController();
  String train = "Rajdhani";

  Future<void> coronaApiGet() async {
    var response = await apiHelper.coronaApiCall(train);
    homeModal = response!;
    notifyListeners();
  }

  void search() {
    train = trainc.text;
    notifyListeners();
  }
}