part of 'country_bloc.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class Recordstarted extends CountryState{
  List<dynamic> record;
  Recordstarted(this.record);
}

class Exception extends CountryState {}