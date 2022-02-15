import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_demo/Views/AuthUI/login.dart';
import 'package:riverpod_flutter_demo/Views/splash.dart';

final routeChanger = StateNotifierProvider<WidgetChanger, Widget>((ref) {
  return WidgetChanger();
});

class WidgetChanger extends StateNotifier<Widget> {
  WidgetChanger() : super(const Spalsh()) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => state = const Login(),
    );
  }
}
