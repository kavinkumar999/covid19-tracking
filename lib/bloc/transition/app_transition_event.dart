part of 'app_transition_bloc.dart';

@immutable
abstract class AppTransitionEvent {}

class TransitionIndex extends AppTransitionEvent{
  var index;
  TransitionIndex(
    this.index,
  );
}