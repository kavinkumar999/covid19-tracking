import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19/data_layer/repository/repository.dart';
import 'package:meta/meta.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial());
  Repository repo = new Repository();
  @override
  Stream<CountryState> mapEventToState(
    CountryEvent event,
  ) async* {
    if (event is Refreshtype){
      try {
        List<dynamic> record =  new List();
        record = await repo.getdatabase();
        
        print("bloc");
        print(record);
        yield Recordstarted(record);
        
      } catch (e) {
        print(e);
        yield Exception();

      }
    }

  }
}
