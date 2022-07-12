import 'package:auth/auth.dart';

class BenimUserModel extends BenimUser {
  BenimUserModel();

  Map<String, dynamic> toMap() {
    return {
      // 'email': getEmail(),
      'email': "fake@mail.com",
      'role': ["user"],
    };
  }
}
