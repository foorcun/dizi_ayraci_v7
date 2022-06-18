import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// General successes
class SignInSuccess extends Success {}

class SignOutSuccess extends Success {}
