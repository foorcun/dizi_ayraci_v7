library auth;

import 'package:auth/src/features/user/presentation/plain/plain_sign_in.dart';
import 'package:auth/src/features/user/presentation/state_management/bindings/home_binding.dart';

import './src/injection_container.dart' as di;

import '/src/features/user/presentation/state_management/all_dizi_bindings.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//EXPORTS
// export './src/features/user/presentation/plain/plain_sign_in.dart';
export './src/main_presentation/main_presentation_helper.dart';
export './src/features/user/presentation/state_management/all_dizi_bindings.dart';
export './src/features/user/presentation/state_management/user_controller.dart';
export "./src/main_presentation/routes/app_pages.dart";
export "./src/features/user/presentation/state_management/bindings/binding_export.dart";
export "./src/features/user/domain/entities/BenimUser.dart";

bool USE_FIRESTORE_EMULATOR = false;
final firestoreManager = FirebaseFirestore.instance;

Future<void> main() async {
  // await di.init();
  // AllUserBindings().dependencies();

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // if (USE_FIRESTORE_EMULATOR) {
  //   FirebaseFirestore.instance.settings = const Settings(
  //     host: 'localhost:8080',
  //     sslEnabled: false,
  //     persistenceEnabled: false,
  //   );
  // }

  print("auth main calisiyor.");
}

class AllAuthInit {
  void dependencies() async {
    await di.init();
    AllUserBindings().dependencies();
    HomeBinding().dependencies();

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    if (USE_FIRESTORE_EMULATOR) {
      FirebaseFirestore.instance.settings = const Settings(
        host: 'localhost:8080',
        sslEnabled: false,
        persistenceEnabled: false,
      );
    }
  }
}
