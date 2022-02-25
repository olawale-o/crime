import 'dart:convert';
import '../../services/http_service.dart';
import '../../models/person_model.dart';

abstract class DataSource {
  Future<List<PersonModel>> getSuggestedFriends(String endPoint);
}

class RemoteDataSource implements DataSource {
  final HttpService httpService = HttpService();

  @override
  Future<List<PersonModel>> getSuggestedFriends(String endPoint) async {
    var response = await httpService.get(endPoint);
    var results = json.decode(response.body);
    List data = results['users'];
    List<PersonModel> users = data.map((user) => PersonModel.fromJson(user)).toList();
    return users;
  }
}