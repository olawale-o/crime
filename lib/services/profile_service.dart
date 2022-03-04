import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'http_service.dart';

class ProfileService {

  ProfileService(this._httpService);
  final HttpService _httpService;

  Future<UserModel> getMyProfile(Map<String, dynamic> map) async {
    http.Response response = await _httpService.get('user/${map['email']}', token: map['token']);
    var data = transformRequest(response);
    if (data == null) {
      return const UserModel(uid: '');
    }
    return UserModel.fromJson(data);
  }

  Future<UserModel> createProfile(Map<String, dynamic> map) async {
    http.Response response = await _httpService.post(map['json'], "user", token: map['token']);
    var data = transformRequest(response);
    return UserModel.fromJson(data);
  }

  dynamic transformRequest(http.Response response) {
    var result = json.decode(response.body);
    print(result);
    return result["data"]["user"];
  }
}