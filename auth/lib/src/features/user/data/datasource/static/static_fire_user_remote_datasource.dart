import 'dart:convert';

import 'package:auth/src/core/error/success.dart';
import 'package:auth/src/features/user/data/datasource/static/static_user_remote_data_source.dart';
import 'package:auth/src/features/user/domain/entities/BenimUser.dart';
import 'package:auth/src/features/user/domain/usecases/write_user_data_usecase.dart';

import 'package:http/http.dart' as http;

class StaticFireUserRemoteDataSource implements StaticUserRemoteDataSource {
  Uri myUri = Uri.parse("https://js-test-e5720.firebaseio.com/users.json");

  @override
  Future<Success> addUser(AddUserParams addUserParams) async {
    // TODO: implement addUser
    // throw UnimplementedError();
    // print("StaticFireUserRemoteDataSource add user");
    // print(addUserParams.toString());
    // return MockSuccess();

    Map<String, dynamic> bodyyy = addUserParams.eklenecekUser.toMap();
    var response = await http.post(
      myUri,
      body: jsonEncode(bodyyy),
      headers: {
        "Content-Type": "application/json",
      },
    );

    return DataUpdatedSuccess();
  }

  @override
  Future<List<BenimUser>> getAllUserFuture() {
    // TODO: implement getAllUserFuture
    throw UnimplementedError();
  }
}
