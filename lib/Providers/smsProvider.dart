import 'package:flutter_riverpod/flutter_riverpod.dart';

final smsProvider =
    StateNotifierProvider.family<SmsReader, String, String>((ref, str) {
  return SmsReader(str);
});

class SmsReader extends StateNotifier<String> {
  SmsReader(str) : super('');
}
