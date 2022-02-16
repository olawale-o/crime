import 'package:flutter/material.dart';
import '../../models/person_model.dart';

class SuggestionUserCard extends StatelessWidget {
  final PersonModel person;
  const SuggestionUserCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            UserAvatar(avatar: person.avatar,),
            UserInfo(username: person.username),
            const FollowButton()
          ],
        )
    );
  }
}


class UserAvatar extends StatelessWidget {
  final String? avatar;
  const UserAvatar({Key? key, this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: avatar == null ? const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/avatar.jpg')
          ) : DecorationImage(
            image: NetworkImage("http://10.0.2.2:3000/$avatar"),
            fit: BoxFit.fill,
          )
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String username;
  const UserInfo({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
            Text("@$username", style: const TextStyle(fontSize: 14.0))
          ],
        ),
      ),
    );
  }
}


class FollowButton extends StatelessWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('taped'),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(width: 2.0, color: Colors.black)),
        child: const Text(
          'Connect',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
