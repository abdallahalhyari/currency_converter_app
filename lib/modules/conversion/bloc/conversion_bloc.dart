import 'package:bloc/bloc.dart';
import 'package:currency_converter_app/main.dart';
import 'package:currency_converter_app/models/country_model.dart';
import 'package:currency_converter_app/modules/conversion/data/repository.dart';
import 'package:currency_converter_app/utiltes/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'conversion_event.dart';
part 'conversion_state.dart';

class ConversionBloc extends Bloc<ConversionEvent, ConversionState> {
  int tobSelectedCountryIndex = 0;
  int bottomSelectedCountryIndex = 1;
  List<CountryModel> countries = [];
  TextEditingController textEditingAmountController =
      TextEditingController(text: '0');
  double exchangeRate = 0;
  String finalResult = '0';

  final ConversionRepository conversionRepository = ConversionRepository();
  ConversionBloc() : super(ConversionInitial()) {
    on<TopSelectCountry>((event, emit) async {
      tobSelectedCountryIndex = event.index;
      add(GetResultConversion());
    });

    on<BottomSelectCountry>((event, emit) async {
      bottomSelectedCountryIndex = event.index;
      add(GetResultConversion());
    });

    on<GetCountriesEvent>((event, emit) async {
      countries.clear();
      DatabaseHelper databaseHelper = DatabaseHelper();
      if(sharedPreferences.getBool('isDBActive')==true){
        List<Map<String,dynamic>> list=await databaseHelper.readData('select * from currencies');
        print(list.length);
       for (int i=0;i<list.length;i++){
         countries.add(CountryModel(id: list[i]['id'], name: list[i]['name'], alpha3: list[i]['alpha3'], currencyId: list[i]['currencyId'], currencyName: list[i]['currencyName'], currencySymbol: list[i]['currencySymbol']));
       }
        emit(GetCountries());
        return ;
      }
      countries = await conversionRepository.getCountries();

      for (var value in countries) {
        await databaseHelper.insertData(value);
      }
      sharedPreferences.setBool('isDBActive', true);

      emit(GetCountries());
    });

    on<GetResultConversion>((event, emit) async {
      exchangeRate = await conversionRepository.requestExchangeRate(
          countries[tobSelectedCountryIndex].currencyId,
          countries[bottomSelectedCountryIndex].currencyId);
      finalResult = (exchangeRate *
              double.parse(textEditingAmountController.text.toString()))
          .toStringAsFixed(2);
      emit(UpdatedResultConversion());
    });
  }
}
