import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chatmessage_model.dart';
import '../notifiers/chat_message_notifier.dart';


final chatMessageNotifierProvider = StateNotifierProvider<ChatMessageNotifier, List<ChatMessage>>((ref){
  return ChatMessageNotifier(ref);
});
