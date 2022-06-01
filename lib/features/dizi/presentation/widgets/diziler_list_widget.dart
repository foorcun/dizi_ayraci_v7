import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/controller/dizi_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DizilerListWidget extends StatelessWidget {
  const DizilerListWidget({Key? key}) : super(key: key);

  _loadData() async {
    //https://www.youtube.com/watch?v=q2vUKcrL5CI
    await Get.find<DiziController>().fetchDiziler();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    // return Center(
    //   child: Text("asdf"),
    // );
    // print(Get.find<DiziController>().diziler.length);

    return Obx(() => Get.find<DiziController>().isSuccess.value != true
        ? Center(
            child: Text("Bir hata olustu: " +
                Get.find<DiziController>().failureMessage.value),
          )
        : ListView.builder(
            itemCount: Get.find<DiziController>().diziler.length,
            itemBuilder: (context, index) {
              print("DizilerListView");

              // return Text("sadfiuuuuu");
              return Card(
                child: ListTile(
                  title: Get.find<DiziController>().diziler[index].diziName !=
                          null
                      ? Text(
                          Get.find<DiziController>().diziler[index].diziName!)
                      : Text("Dizi adi yok"),
                ),
              );
            },
          ));
  }
}
