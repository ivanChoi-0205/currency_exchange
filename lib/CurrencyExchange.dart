import 'dart:convert';

import 'package:flutter/material.dart';
import 'DataModel.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:currency_picker/currency_picker.dart' as currency_picker;

class CurrencyExchange extends StatefulWidget {
  CurrencyExchange({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CurrencyExchangeState createState() => _CurrencyExchangeState();
}

Future<Currency> fetchCurrency() async {
  String url = 'https://api.exchangerate-api.com/v4/latest/HKD';
  final response = await http.get(Uri.parse(url));

  // var responseBody = json.decode(response.body);
  //   Map curMap = responseBody['rates'];
  //   currencies = curMap.keys.toList();

  if (response.statusCode == 200) {
    // return jsonDecode(response.body);
    return Currency.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load currency api");
  }
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  // String url = 'https://api.exchangerate-api.com/v4/latest/HKD';
  // Future<http.Response> fetchAlbum() {
  //   return http.get(Uri.parse(url));
  // }
  late Future<Currency> futureCurrency;
  var favorite = ['HKD', 'USD'];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    futureCurrency = fetchCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Text('Bottom'),
          color: Colors.orangeAccent,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    currency_picker.showCurrencyPicker(
                      context: context,
                      showFlag: true,
                      showCurrencyName: true,
                      showCurrencyCode: true,
                      // currencyFilter: <String>[
                      //   'EUR',
                      //   'GBP',
                      //   'USD',
                      //   'AUD',
                      //   'CAD',
                      //   'JPY',
                      //   'HKD',
                      //   'CHF',
                      //   'SEK',
                      //   'ILS'
                      // ],
                      onSelect: (currency) {
                        print('Select currency: ${currency.name}');
                        if (!favorite.contains(currency.code)) {
                          favorite.add(currency.code);
                        }
                        print('Select currency: ${currency.code}');
                      },
                      favorite: favorite,
                    );
                  },
                  child: const Text('Show currency picker'),
                )),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    favorite.clear();
                  },
                  child: const Text('Clear record'),
                )),
              ],
            ),
            TextField(
              // keyboardType: TextInputType.number,
              // controller: number,
              keyboardType: TextInputType.number,
              autocorrect: true,
              textInputAction: TextInputAction.next,

              decoration: InputDecoration(
                  labelText: 'From', hintText: 'Enter Your Number Here'),
            ),
            Text('Hello'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    currency_picker.showCurrencyPicker(
                      context: context,
                      showFlag: true,
                      showCurrencyName: true,
                      showCurrencyCode: true,
                      // currencyFilter: <String>[
                      //   'EUR',
                      //   'GBP',
                      //   'USD',
                      //   'AUD',
                      //   'CAD',
                      //   'JPY',
                      //   'HKD',
                      //   'CHF',
                      //   'SEK',
                      //   'ILS'
                      // ],
                      onSelect: (currency) {
                        print('Select currency: ${currency.name}');
                        if (!favorite.contains(currency.code)) {
                          favorite.add(currency.code);
                        }
                        print('Select currency: ${currency.code}');
                      },
                      favorite: favorite,
                    );
                  },
                  child: const Text('Show currency picker'),
                )),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    favorite.clear();
                  },
                  child: const Text('Clear record'),
                )),
              ],
            ),
            TextField(
              // keyboardType: TextInputType.number,
              // controller: number,
              keyboardType: TextInputType.number,
              autocorrect: true,
              textInputAction: TextInputAction.done,

              decoration: InputDecoration(
                  labelText: 'To', hintText: 'Enter Your Number Here'),
            ),
            // Center(
            //   child: FutureBuilder<Currency>(
            //     future: futureCurrency,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         /*
            //         return Text(snapshot.data!.provider +
            //             '\n' +
            //             snapshot.data!.base +
            //             '\n' +
            //             snapshot.data!.time_last_updated.toString() +
            //             '\n' +
            //             snapshot.data!.date +
            //             '\n' +
            //             snapshot.data!.rates["HKD"].toString());
            //         */
            //         return Wrap(
            //           alignment: WrapAlignment.spaceEvenly,
            //           children: [
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('Rates prodiver: ${snapshot.data!.provider}'),
            //                 Text('To: ${snapshot.data!.base}'),
            //                 Text(
            //                     'Time last updated: ${snapshot.data!.time_last_updated.toString()}'),
            //                 Text('Date: ${snapshot.data!.date}'),
            //                 Text(
            //                     'rates: ${snapshot.data!.rates["HKD"].toString()}'),
            //               ],
            //             )
            //             // Chip(label: Text(snapshot.data!.provider)),
            //           ],
            //         );
            //       } else if (snapshot.hasError) {
            //         return Text('${snapshot.error}');
            //       }
            //       // By default, show a loading spinner.
            //       return const CircularProgressIndicator();
            //     },
            //   ),
            // ),
            IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: FutureBuilder<Currency>(
                        future: futureCurrency,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            /*
                    return Text(snapshot.data!.provider +
                        '\n' +
                        snapshot.data!.base +
                        '\n' +
                        snapshot.data!.time_last_updated.toString() +
                        '\n' +
                        snapshot.data!.date +
                        '\n' +
                        snapshot.data!.rates["HKD"].toString());
                    */
                            return Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Rates prodiver: ${snapshot.data!.provider}'),
                                    Text('To: ${snapshot.data!.base}'),
                                    Text(
                                        'Time last updated: ${snapshot.data!.time_last_updated.toString()}'),
                                    Text('Date: ${snapshot.data!.date}'),
                                    Text(
                                        'rates: ${snapshot.data!.rates["HKD"].toString()}'),
                                  ],
                                )
                                // Chip(label: Text(snapshot.data!.provider)),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ));
  }
}

// https://api.currconv.com/api/v7/convert?q=USD_PHP,PHP_USD&compact=ultra&apiKey=72db82a968c2e2b4f867
//https://api.exchangerate-api.com/v4/latest/HKD