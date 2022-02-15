import 'package:flutter/material.dart';

class Spalsh extends StatelessWidget {
  const Spalsh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Center(
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
        ),
      ),
    );
  }
}
