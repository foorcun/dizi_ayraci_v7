import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DiziListPage extends StatelessWidget {
  const DiziListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dizi List Page"),
      ),
      body: Center(
        child: Text("Dizi list page"),
      ),
    );
  }
}
