import 'package:currency_converter_app/modules/conversion/bloc/conversion_bloc.dart';
import 'package:currency_converter_app/modules/historical/bloc/historical_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setup() {

  debugPrint("setup is called");

  getIt.registerFactory<ConversionBloc>(() => ConversionBloc());
  getIt.registerFactory<HistoricalBloc>(() => HistoricalBloc());

}