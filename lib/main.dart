import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexam_111/screen/home/provider/api_provider.dart';
import 'package:rexam_111/screen/home/view/api_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => api_provider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) =>apiScreen() ,
        },
      ),
    ),
  );
}