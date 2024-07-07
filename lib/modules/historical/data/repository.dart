import 'package:currency_converter_app/models/exchange_rate_model.dart';
import 'package:currency_converter_app/modules/historical/data/api.dart';

class HistoricalRepository{
  final HistoricalAPI historicalAPI=HistoricalAPI();
  Future<Map<String, List<ExchangeRateModel>>> fetchExchangeRates() async {
    Map<String, List<ExchangeRateModel>> result=await historicalAPI.fetchExchangeRates();
    return result;
  }
}