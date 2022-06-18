import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String? failureMessage;
  Failure({
    this.failureMessage,
  });
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({
    String? failureMessage,
  }) : super(failureMessage: failureMessage);
}

class GeneralSignInFailure extends Failure {}

class SignOutFailure extends Failure {}

class DataNotFoundFailure extends Failure {}

class CacheFailure extends Failure {}
