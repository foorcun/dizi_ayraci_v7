import 'package:auth/auth.dart';

import '../widget/sign_in_button.dart';
import 'package:flutter/material.dart';

class PlainSignIn extends StatelessWidget {
  PlainSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SignInButtonum()],
        ),
      ),
    );
  }
}
