import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props {
    // print("UnimplementedError buuuu");
    // throw UnimplementedError();
    return [];
  }
}

// General successes
class GetDataSuccess extends Success {}

class GetDataSuccess304 extends Success {}

class DataAddedSuccess extends Success {}

class DataUpdatedSuccess extends Success {}

class DataDeletedSuccess extends Success {}
