
class PersonModel {
  final String username;
  final String email;
  final String? phoneNo;
  final String? avatar;

  PersonModel({ required this.email, required this.username, this.phoneNo, this.avatar });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      email: json['email'],
      username: json['username'],
      phoneNo: json['phoneNo'],
      avatar: json['profilePic']
    );
  }
}