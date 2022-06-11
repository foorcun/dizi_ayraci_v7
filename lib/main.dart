import 'package:dizi_ayraci_v7/features/dizi/presentation/plain/plain_diziler.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/all_dizi_bindings.dart';
import 'package:dizi_ayraci_v7/features/main_presentation/dizi_add_page.dart';
import 'package:dizi_ayraci_v7/features/main_presentation/dizi_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'injection_container.dart' as di;

//start the server
//start C:\API
//json-server --watch dizi_ayraci_inner.json

// flutter run -d chrome --web-hostname localhost --web-port 5000 --no-sound-null-safety

void main() async {
  await di.init();
  AllDiziBindings().dependencies();
  // runApp(const PlainDiziler());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dizi ayraci v7',
      // home: const DiziListPage(),
      initialRoute: "/DiziListPage",
      getPages: [
        GetPage(name: "/DiziListPage", page: () => DiziListPage()),
        GetPage(name: "/DiziAddPage", page: () => DiziAddPage()),
      ],
    );
  }
}
