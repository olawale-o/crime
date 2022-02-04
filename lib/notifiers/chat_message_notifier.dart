import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../models/chatmessage_model.dart';
import '../providers/socket_provider.dart';

class ChatMessageNotifier extends StateNotifier<List<ChatMessage>>{
  late Socket socket;
  ChatMessageNotifier(this.ref) : super([]) {
    socket = ref.read(socketProvider);
    socket.on('chat message', (data) => updateList(ChatMessage(messageContent: data, messageType: 'receiver')));
  }
  final Ref ref;
  void updateList(ChatMessage chatMessage) {
    state = [...state, chatMessage];
  }

  void sendMessage(String message) {
    updateList(ChatMessage(messageContent: message, messageType: 'sender'));
    socket.emit('chat message', message);
  }
}