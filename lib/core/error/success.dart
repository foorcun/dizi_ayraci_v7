import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// General successes
class DataAddedSuccess extends Success {}

class DataUpdatedSuccess extends Success {}

class DataDeletedSuccess extends Success {}
