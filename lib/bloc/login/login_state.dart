import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  LoginState(this.version);

  /// notify change state without deep clone state
  final int version;

  /// Copy object for use in action
  /// if need use deep clone
  LoginState getStateCopy();

  LoginState getNewVersion();

  @override
  List<Object> get props => [version];
}

/// UnInitialized
class UnLoginState extends LoginState {
  UnLoginState(int version) : super(version);

  @override
  String toString() => 'UnLoginState';

  @override
  UnLoginState getStateCopy() {
    return UnLoginState(0);
  }

  @override
  UnLoginState getNewVersion() {
    return UnLoginState(version + 1);
  }
}

/// Initialized
class InLoginState extends LoginState {
  InLoginState(int version, this.hello) : super(version);

  final String hello;

  @override
  String toString() => 'InLoginState $hello';

  @override
  InLoginState getStateCopy() {
    return InLoginState(version, hello);
  }

  @override
  InLoginState getNewVersion() {
    return InLoginState(version + 1, hello);
  }

  @override
  List<Object> get props => [version, hello];
}

class ErrorLoginState extends LoginState {
  ErrorLoginState(int version, this.errorMessage) : super(version);

  final String errorMessage;

  @override
  String toString() => 'ErrorLoginState';

  @override
  ErrorLoginState getStateCopy() {
    return ErrorLoginState(version, errorMessage);
  }

  @override
  ErrorLoginState getNewVersion() {
    return ErrorLoginState(version + 1, errorMessage);
  }

  @override
  List<Object> get props => [version, errorMessage];
}
