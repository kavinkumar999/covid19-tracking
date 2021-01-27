import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:bloc/bloc.dart';
import 'package:covid19/bloc/country_record/country_bloc.dart';
import 'package:covid19/data_layer/repository/repository.dart';
import 'package:meta/meta.dart';

part 'india_record_event.dart';
part 'india_record_state.dart';

class IndiaRecordBloc extends Bloc<IndiaRecordEvent, IndiaRecordState> {
  IndiaRecordBloc() : super(IndiaRecordInitial());
  Repository repo = new Repository();

  @override
  Stream<IndiaRecordState> mapEventToState(

    IndiaRecordEvent event,
  ) async* {
    // TODO: implement mapEventToState
       yield Startfunction();
   
    if(event is Startfetch){
       yield Startfunction();
      try {
        Map<String,dynamic> indiadata = new Map();
        indiadata = await repo.indiacases();
        yield Recordfetch(indiadata);
        
      } catch (e) {
        yield Startfunction();
        
        try {
        Map<String,dynamic> record = new Map();
        SharedPreferences indiadata = await SharedPreferences.getInstance();
        record["country"] = indiadata.getString("countryname");
        record["cases"] = indiadata.getString("cases");
        record["recovered"] = indiadata.getString("recovered");
        record["deaths"] = indiadata.getString("deaths");
        record["active"] = indiadata.getString("active");
        yield Previousdata(record);


          
        } catch (e) {
          yield Exception();
        }
      }
    }
  }
}
