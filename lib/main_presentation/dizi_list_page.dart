import 'package:auth/auth.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/widgets/diziler_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DiziListPage extends StatelessWidget {
  const DiziListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dizi List Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _floatingAddDizi,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // body: Center(
      //   child: Text("asdfadsfdsaf"),
      // ),
      body: Column(
        children: [
          Expanded(
            // child: Text("Dizi list page"),
            child: DizilerListWidget(),
          ),
        ],
      ),
    );
  }

  void _floatingAddDizi() {
    Get.toNamed("/DiziAddPage");
  }
}
