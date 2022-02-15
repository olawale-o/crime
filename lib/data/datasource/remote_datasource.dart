import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/person_model.dart';

abstract class DataSource {}

class RemoteDataSource {
  static final http.Client client = http.Client();
  static const baseURI = 'http://10.0.2.2:3000/v1/api/';

  static Future<List<PersonModel>> getSuggestedFriends(String endPoint) async {
    var url = Uri.parse("$baseURI$endPoint");
    http.Response response = await client.get(url);
    var results = json.decode(response.body);
    List data = results['users'];
    List<PersonModel> users = data.map((user) => PersonModel.fromJson(user)).toList();
    return users;
  }
}