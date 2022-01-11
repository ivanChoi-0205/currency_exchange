import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'CurrencyExchange.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyExchange(title: 'Currency Converter'),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
