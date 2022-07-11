import 'package:auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';
import 'package:dizi_ayraci_v7/core/error/success.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/controller/dizi_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class DizilerListWidget extends StatelessWidget {
  // const DizilerListWidget({Key? key}) : super(key: key);

  // Either<Failure, Success> response = Right(GetDataSuccess());

  _loadData() async {
    //https://www.youtube.com/watch?v=q2vUKcrL5CI
    print('ffffffffffffffffffffffffffff');
    print('ffffffffffffffffffffffffffff');
    await Get.find<UserController>().writeUser(BenimUser());
    await Get.find<DiziController>().fetchDiziler();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();

    //     ? _FailureWidget()
    //     : _SuccessWidget());
    return Obx(
      () => Get.find<DiziController>().responseC.value != null
          ? Get.find<DiziController>().responseC.value!.fold((l) {
              return _FailureWidget();
            }, (r) {
              return _SuccessWidget();
            })
          : _ProgressWidgetim(),
    );
  }
}

class _ProgressWidgetim extends StatelessWidget {
  const _ProgressWidgetim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: Get.find<DiziController>().diziler.length,
          itemBuilder: (context, index) {
            // print("DizilerListView");

            // return Text("sadfiuuuuu");
            return Slidable(
              child: DizilerCard(index: index),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  _SlidableActionDiziList(),
                ],
              ),
            );
          },
        ));
  }
}

class _SlidableActionDiziList extends StatelessWidget {
  const _SlidableActionDiziList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      flex: 2,
      onPressed: (BuildContext context) {
        print("basıldım...");

        showDialog(
            context: context,
            builder: (_) {
              return CupertinoAlertDialog(
                // content: Text(cDizi.diziName.toString() +
                content: Text(
                    "cDizi.diziName.toString()" + " silmek ister misiniz?"),
                actions: [
                  CupertinoDialogAction(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        Get.back();
                      },
                      child: Text("İptal"),
                    ),
                  ),
                  CupertinoDialogAction(
                    child: ElevatedButton(
                      child: Text("Evet"),
                      onPressed: () async {
                        // await cDizi.delete();
                        Get.back();
                      },
                    ),
                  )
                ],
              );
            });
      },
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.delete_forever,
      label: 'Delete',
    );
  }
}

class DizilerCard extends StatelessWidget {
  int index = -1;
  DizilerCard({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(index);
    return Card(
      child: ListTile(
        title: Get.find<DiziController>().diziler[index].diziName != null
            ? Text(Get.find<DiziController>().diziler[index].diziName!)
            : Text("Dizi adi yok"),
      ),
    );
  }
}

class _FailureWidget extends StatelessWidget {
  const _FailureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Bir hata olustu: " +
          // Get.find<DiziController>().failureMessage.value),
          Get.find<DiziController>()
              .responseC
              .value!
              .fold((l) => l.failureMessage!, (r) => "basarili")),
    );
  }
}
