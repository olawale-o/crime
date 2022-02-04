import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/chatlist_screen.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(ioClientProvider);
    return const Scaffold(
      body: ChatListScreen(),
    );
  }
}
