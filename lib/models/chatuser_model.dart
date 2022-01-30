import 'package:faker/faker.dart';

class ChatUser {
  final String name;
  final String messageText;
  final String avatar;
  final String time;

  ChatUser({required this.name, required this.messageText, required this.avatar, required this.time});
}

var faker = Faker();
List<ChatUser> users = List.generate(10,
        (index) => ChatUser(name: faker.person.firstName(), messageText: faker.lorem.sentence(), avatar: 'https://randomuser.me/api/portraits/men/$index.jpg', time: '${faker.date.dateTime().hour}:${faker.date.dateTime().minute}'));
