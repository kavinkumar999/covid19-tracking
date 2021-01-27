part of 'india_record_bloc.dart';

@immutable
abstract class IndiaRecordState {}

class IndiaRecordInitial extends IndiaRecordState {}

class Startfunction extends IndiaRecordState {}

class Recordfetch extends IndiaRecordState {
  Map<String,dynamic> indiadata = new Map();
  Recordfetch(
    this.indiadata,
  );
}

class Exception extends IndiaRecordState {}

class Previousdata extends IndiaRecordState{
  Map<String,dynamic> indiadata = new Map();
  Previousdata(
    this.indiadata,
  );
}
