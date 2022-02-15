import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_demo/main.dart';
import 'package:telephony/telephony.dart';

final smsProvider = FutureProvider<List<SmsMessage>>((ref) async {
  final list = await Telephony.instance.getInboxSms(columns: [
    SmsColumn.ADDRESS,
    SmsColumn.BODY
  ], sortOrder: [
    OrderBy(SmsColumn.DATE, sort: Sort.DESC),
  ]);
  Telephony.instance.listenIncomingSms(
    onNewMessage: (smsMessage) async {
      list.add(smsMessage);
    },
    listenInBackground: true,
    onBackgroundMessage: onBackgroundHandler,
  );
  return list;
});
