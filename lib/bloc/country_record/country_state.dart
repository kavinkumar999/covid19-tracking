part of 'country_bloc.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class Recordstarted extends CountryState{
  List<dynamic> record;
  Recordstarted(this.record);
}

class Exception extends CountryState {}

class Waiting extends CountryState {}

class Previousdata extends CountryState{
   List<dynamic> record;
  Previousdata(this.record);
}
