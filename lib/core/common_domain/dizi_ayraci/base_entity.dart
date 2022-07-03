
import 'package:equatable/equatable.dart';

abstract class BaseEntity<ID>{

     ID? _id;

  ID? get id => _id;

  set id(ID? id) {
    _id = id;
  }



  @override
bool operator ==(Object other) {
  if (identical(this, other))
    return true;
  if (other.runtimeType != runtimeType)
    return false;
  return other is BaseEntity
      && other.id == id;
}


@override
  // int get hashCode => super.hashCode;
  int get hashCode => _id.hashCode;

}