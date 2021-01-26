import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_transition_event.dart';
part 'app_transition_state.dart';

class AppTransitionBloc extends Bloc<AppTransitionEvent, AppTransitionState> {
  AppTransitionBloc() : super(AppTransitionInitial());

  @override
  Stream<AppTransitionState> mapEventToState(
    AppTransitionEvent event,
  ) async* {
    if(event is TransitionIndex){
      if(event.index == 0){
        yield Homepage(event.index);
      }
      if(event.index == 1){
        yield IndiaPage(event.index);
      }
      if(event.index  == 2){
        yield CountryPage(event.index);
      }
      if(event.index == 3){
        yield AboutPage(event.index);
      }
      if(event.index == 4){
        yield GuidelinePage(event.index);
      }
    }

  }
}
