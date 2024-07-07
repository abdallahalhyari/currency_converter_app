part of 'conversion_bloc.dart';

@immutable
sealed class ConversionEvent {
}
class TopSelectCountry extends ConversionEvent {
  final int index;
TopSelectCountry({required this.index});

}

class BottomSelectCountry extends ConversionEvent {
  final int index;
  BottomSelectCountry({required this.index});
}


class GetCountriesEvent extends ConversionEvent {

}


class GetResultConversion extends ConversionEvent {

}