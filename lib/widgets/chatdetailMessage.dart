import 'package:crime/providers/chat_message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailMessage extends StatelessWidget {
  const ChatDetailMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _){
        final messageList = ref.watch(chatMessageNotifierProvider);
        return ListView.builder(
          itemCount: messageList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          //physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Container(
              padding: const EdgeInsets.only(left: 14,right: 14,top: 10, bottom: 10),
              child: Align(
                alignment: (messageList[index].messageType == "receiver"? Alignment.topLeft: Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messageList[index].messageType  == "receiver" ? Colors.grey.shade200: Colors.blue[200]),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Text(messageList[index].messageContent, style: const TextStyle(fontSize: 15),),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
