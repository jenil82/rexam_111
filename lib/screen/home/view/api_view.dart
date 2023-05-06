import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/api_model.dart';
import '../provider/api_provider.dart';

class apiScreen extends StatefulWidget {
  const apiScreen({Key? key}) : super(key: key);

  @override
  State<apiScreen> createState() => _apiScreenState();
}

class _apiScreenState extends State<apiScreen> {
  api_provider? apiProviderTrue;
  api_provider? apiProviderFalse;

  @override
  Widget build(BuildContext context) {
    apiProviderTrue = Provider.of<api_provider>(context, listen: true);
    apiProviderFalse = Provider.of<api_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(" india-Rail"),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            FutureBuilder(
              future: apiProviderTrue!.coronaApiGet(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  apiModel homeModal = apiModel();
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 400,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Train Data",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Container(
                              height: 52,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: TextField(
                                  controller: apiProviderTrue!.trainc,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIconColor: Colors.white,
                                    hintText: "search ",
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


