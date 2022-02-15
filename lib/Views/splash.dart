import 'package:flutter/material.dart';

class Spalsh extends StatelessWidget {
  const Spalsh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FlutterLogo(
        size: 200,
        style: FlutterLogoStyle.horizontal,
      ),
    );
  }
}
