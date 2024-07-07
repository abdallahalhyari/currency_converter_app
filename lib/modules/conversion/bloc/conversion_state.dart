part of 'conversion_bloc.dart';

@immutable
sealed class ConversionState {}

final class ConversionInitial extends ConversionState {}

final class SelectedCountry extends ConversionState {}


class TopSelectedCountry extends ConversionState {

}

class GetCountries extends ConversionState {

}

class BottomSelectedCountry extends ConversionState {

}

class UpdatedResultConversion extends ConversionState {

}