import 'package:currency_converter_app/models/country_model.dart';
import 'package:currency_converter_app/modules/conversion/data/api.dart';

class ConversionRepository{
  final ConversionAPI conversionAPI=ConversionAPI();

  Future<double> requestExchangeRate(String topSelectedCurrencyCode,String bottomSelectedCurrencyCode) async {
    double result=await conversionAPI.requestExchangeRate(topSelectedCurrencyCode, bottomSelectedCurrencyCode);
    return result;
  }

  Future<List<CountryModel>> getCountries() async {
    List<CountryModel> result=await conversionAPI.getCountries();
    return result;
  }
}