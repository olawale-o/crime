import 'package:flutter/material.dart';
import '../widgets/chatlist_header_page_header.dart';
import '../widgets/conversation_list_widget.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ChatListPageHeader(),
          ConversationList(),
        ],
      )
    );
  }
}
