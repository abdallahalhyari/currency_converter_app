import 'dart:convert';

import 'package:currency_converter_app/main.dart';
import 'package:currency_converter_app/models/exchange_rate_model.dart';
import 'package:currency_converter_app/utiltes/constant.dart';
import 'package:currency_converter_app/utiltes/date.dart';
import 'package:currency_converter_app/widgets/Error_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoricalAPI {
  final http.Client? client;
  HistoricalAPI({this.client});
  Future<Map<String, List<ExchangeRateModel>>> fetchExchangeRates() async {
    Map<String, List<ExchangeRateModel>> exchangeRates = {
      'USD_JOD': [],
      'JOD_USD': []
    };

    final response = await http.get(Uri.parse(
        '${Constant.BASE_URL}convert?q=USD_JOD,JOD_USD&compact=ultra&date=${DateFunctions.formatDate(DateTime.now().subtract(const Duration(days: 6)))}&endDate=${DateFunctions.formatDate(DateTime.now())}&apiKey=${Constant.API_KEY}'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      data['USD_JOD'].forEach((key, value) {
        exchangeRates['USD_JOD']!
            .add(ExchangeRateModel.fromMap(data['USD_JOD'], key));
      });

      data['JOD_USD'].forEach((key, value) {
        exchangeRates['JOD_USD']!
            .add(ExchangeRateModel.fromMap(data['JOD_USD'], key));
      });


    } else {
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
                    errorStatusCode: response.statusCode,
                    requestUrl:
                        '${Constant.BASE_URL}convert?q=USD_JOD,JOD_USD&compact=ultra&date=${DateFunctions.formatDate(DateTime.now().subtract(const Duration(days: 6)))}&endDate=${DateFunctions.formatDate(DateTime.now())}&apiKey=${Constant.API_KEY}',
                  ),
                ),
              );
            }),
      );
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
    }
    return exchangeRates;
  }
}
