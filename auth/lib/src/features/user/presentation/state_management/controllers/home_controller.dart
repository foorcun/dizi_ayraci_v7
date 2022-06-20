import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:auth/src/main_presentation/routes/app_pages.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    print("HomeController calisiyor");
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    print("handleAuthStateChanged calisiyor");

    if (isLoggedIn) {
      print("isLogg " + isLoggedIn.toString());

      Get.offAllNamed(Routes.WELCOME, arguments: firebaseAuth.currentUser);
    } else {
      print("isLogg " + isLoggedIn.toString());

      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
