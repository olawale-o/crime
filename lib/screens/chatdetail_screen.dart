import 'package:flutter/material.dart';
import '../widgets/ChatDetailFooter.dart';
import '../widgets/chatdetailMessage.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: const [
            ChatDetailMessage(),
            ChatDetailFooter(),
          ],
    );
  }
}
