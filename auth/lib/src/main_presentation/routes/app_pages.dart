import 'package:auth/src/features/user/presentation/state_management/bindings/home_binding.dart';
import 'package:auth/src/features/user/presentation/state_management/bindings/login_binding.dart';
import 'package:auth/src/features/user/presentation/state_management/bindings/welcome_binding.dart';
import 'package:auth/src/features/user/presentation/state_management/views/home_view.dart';
import 'package:auth/src/features/user/presentation/state_management/views/login_view.dart';
import 'package:auth/src/features/user/presentation/state_management/views/welcome_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
