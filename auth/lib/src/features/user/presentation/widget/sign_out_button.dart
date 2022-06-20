// import '../state_management/user_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '/src/injection_container.dart' as di;
// import '../../domain/usecases/sign_out_user_usecase.dart';

// class SignOutButton extends StatelessWidget {
//   const SignOutButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () async {
//           print("sign out yapiliyor");

//           di
//               .sl<SignOutUserUsecase>()
//               .call(Get.find<UserController>().myUser.value);

//           Navigator.pop(context);
//         },
//         child: Row(
//           children: [
//             Icon(Icons.logout
//                 // Icons.logout,
//                 ),
//             Text("Sign out.."),
//           ],
//         ));
//   }
// }
