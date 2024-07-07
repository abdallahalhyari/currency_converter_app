import 'package:bloc/bloc.dart';
import 'package:currency_converter_app/models/exchange_rate_model.dart';
import 'package:currency_converter_app/modules/historical/data/repository.dart';

import 'package:meta/meta.dart';

part 'historical_event.dart';
part 'historical_state.dart';

class HistoricalBloc extends Bloc<HistoricalEvent, HistoricalState> {
  Map<String, List<ExchangeRateModel>>? data;
  HistoricalBloc() : super(HistoricalInitial()) {
   final HistoricalRepository historicalRepository=HistoricalRepository();
    on<GetHistoricalData>((event, emit) async{
    data= await historicalRepository.historicalAPI.fetchExchangeRates();
    emit(ReceivedHistoricalData());
    });
  }
}
