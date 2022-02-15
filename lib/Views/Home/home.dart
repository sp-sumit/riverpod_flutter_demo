import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_demo/Providers/smsProvider.dart';
import 'package:telephony/telephony.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final no = TextEditingController();
  final msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFormField(
              controller: no,
              decoration: const InputDecoration(
                hintText: 'Mobile no with country code',
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFormField(
              controller: msg,
              decoration: const InputDecoration(
                hintText: 'Message',
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
                Telephony.instance
                    .sendSms(
                  to: no.text.trim(),
                  message: msg.text,
                )
                    .whenComplete(() {
                  no.clear();
                  msg.clear();
                });
              },
              child: const Text('Send Message'),
            ),
            Expanded(
              child: Consumer(builder: (context, state, child) {
                final smsList = state.watch(smsProvider);
                final newMsg = state.watch(sms);
                if (newMsg.isNotEmpty) {
                  state.refresh(smsProvider);
                }
                return smsList.when(
                    data: (list) {
                      return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(list[index].address.toString()),
                              Text(
                                list[index].body.toString(),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    error: (e, s) => Text(e.toString()),
                    loading: () => const CircularProgressIndicator());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
