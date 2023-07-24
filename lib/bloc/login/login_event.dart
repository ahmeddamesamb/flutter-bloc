import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/bloc/login/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc});
  final LoginRepository _loginRepository = LoginRepository();
}

class UnLoginEvent extends LoginEvent {
  @override
  Stream<LoginState> applyAsync({LoginState? currentState, LoginBloc? bloc}) async* {
    yield UnLoginState(0);
  }
}

class LoadLoginEvent extends LoginEvent {
   
  final bool isError;
  @override
  String toString() => 'LoadLoginEvent';

  LoadLoginEvent(this.isError);

  @override
  Stream<LoginState> applyAsync(
      {LoginState? currentState, LoginBloc? bloc}) async* {
    try {
      yield UnLoginState(0);
      await Future.delayed(const Duration(seconds: 1));
      _loginRepository.test(isError);
      yield InLoginState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(0, _.toString());
    }
  }
}
