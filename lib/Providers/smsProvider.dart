import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telephony/telephony.dart';

final smsProvider = FutureProvider<List<SmsMessage>>((ref) async {
  final list = await Telephony.instance.getInboxSms(columns: [
    SmsColumn.ADDRESS,
    SmsColumn.BODY
  ], sortOrder: [
    OrderBy(SmsColumn.DATE, sort: Sort.DESC),
  ]);

  return list;
});

final sms = StateNotifierProvider<SmsManager, List<SmsMessage>>((ref) {
  return SmsManager();
});

class SmsManager extends StateNotifier<List<SmsMessage>> {
  SmsManager() : super([]) {
    Telephony.instance.listenIncomingSms(
      onNewMessage: ((message) {
        state = [message];
      }),
      listenInBackground: false,
    );
  }
}
