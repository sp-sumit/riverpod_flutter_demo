import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_demo/Providers/smsProvider.dart';
import 'package:riverpod_flutter_demo/Routes/routeChanger.dart';
import 'package:telephony/telephony.dart';

onBackgroundHandler(SmsMessage smsMessage) async {
  // print(smsMessage);
  //
}

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverPod Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blue,
      ),
      home: Consumer(builder: (context, state, child) {
        final route = state.watch(routeChanger);
        return route;
      }),
    );
  }
}
