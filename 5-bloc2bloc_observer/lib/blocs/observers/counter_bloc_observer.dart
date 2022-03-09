import 'dart:developer';

import 'package:bloc/bloc.dart';

class CounterBlocObserver extends BlocObserver {
    @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('CounterBlocObserver(event): ${bloc.runtimeType}, $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    log(
        'CounterBlocObserver(error): ${bloc.runtimeType}, $error, $stacktrace');
    super.onError(bloc, error, stacktrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('CounterBlocObserver(change): ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('CounterBlocObserver(transition): ${bloc.runtimeType}, $transition');
  }
}
