import '../features/user/presentation/state_management/user_controller.dart';
import '../features/user/presentation/widget/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Homepageiim ben.."),
            Get.find<UserController>().myUser.value.userCredential != null
                ? Text(Get.find<UserController>()
                    .myUser
                    .value
                    .userCredential!
                    .user!
                    .email!)
                : Text("uid null"),
            SignOutButton()
          ],
        ),
      ),
    );
  }
}
