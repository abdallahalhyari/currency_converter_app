import 'dart:convert';

import 'package:currency_converter_app/main.dart';
import 'package:currency_converter_app/models/country_model.dart';
import 'package:currency_converter_app/utiltes/constant.dart';
import 'package:currency_converter_app/widgets/Error_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConversionAPI {
  final http.Client? client;
  ConversionAPI({this.client});

  Future<double> requestExchangeRate(
      String topSelectedCurrencyCode, String bottomSelectedCurrencyCode) async {
    double exchangeRate = 0;

    // Used try-catch block to catch internet connectivity related exception.

    http.Response response = await http.get(Uri.parse(
        '${Constant.BASE_URL}convert?q=${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode&compact=ultra&apiKey=${Constant.API_KEY}'));

    String requestCurrency =
        '${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode';

    if (response.statusCode == 200) {
      exchangeRate = double.parse((jsonDecode(response.body)[
              '${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode'])
          .toString());
    } else {
      int httpStatusCode = response.statusCode;
      print(httpStatusCode);
      final snackBar = SnackBar(
        content: Text('An unexpected error occurred.'),
        duration: Duration(hours: 24),
        action: SnackBarAction(
            label: 'See details',
            onPressed: () {
              Navigator.push(
                globalKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => ErrorScreen(
                    errorStatusCode: httpStatusCode,
                    requestUrl: requestCurrency,
                  ),
                ),
              );
            }),
      );
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
    }
    return exchangeRate;
  }

  Future<List<CountryModel>> getCountries() async {
    List<CountryModel> countries = [];
    http.Response response = await http.get(
        Uri.parse('${Constant.BASE_URL}countries?apiKey=${Constant.API_KEY}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['results'];

      data.forEach((key, value) {
        countries.add(CountryModel.fromJson(value));
      });
    } else {
      int httpStatusCode = response.statusCode;
      print(httpStatusCode);
      final snackBar = SnackBar(
        content: const Text('An unexpected error occurred.'),
        duration: const Duration(hours: 24),
        action: SnackBarAction(
            label: 'See details',
            onPressed: () {
              Navigator.push(
                globalKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => ErrorScreen(
                    errorStatusCode: httpStatusCode,
                    requestUrl:
                        '${Constant.BASE_URL}countries?apiKey=${Constant.API_KEY}',
                  ),
                ),
              );
            }),
      );
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
    }
    return countries;
  }
}
