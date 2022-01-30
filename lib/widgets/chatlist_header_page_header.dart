import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListPageHeader extends StatelessWidget {
  const ChatListPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Text('Chats', style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        )),
      ),
    );
  }
}
