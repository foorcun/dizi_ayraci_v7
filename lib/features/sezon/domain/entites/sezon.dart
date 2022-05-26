// {
//   "sezonId":1,
//   "sezonName":"1. Sezon",
// }

import 'package:equatable/equatable.dart';

class Sezon extends Equatable {
  int? sezonId;
  String? sezonName;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  String toString() => 'Sezon(sezonId: $sezonId, sezonName: $sezonName)';
}
