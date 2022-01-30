import 'package:flutter/material.dart';
import '../screens/chatlist_screen.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatListScreen(),
    );
  }
}
