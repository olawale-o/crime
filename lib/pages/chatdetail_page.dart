import 'package:flutter/material.dart';
import '../screens/chatdetail_screen.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                  maxRadius: 20,
                ),
                const SizedBox(width: 16.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Olawale'),
                      Text('online')
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () { }, icon: const Icon(Icons.camera_sharp)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: const ChatDetailScreen(),
    );
  }
}
