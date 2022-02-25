import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'http_service.dart';
import '../services/firebase_authentication_service.dart';

class AuthenticationService {
  AuthenticationService(this._httpService);
  final HttpService _httpService;

  StreamController<UserModel> userStream = StreamController<UserModel>();

  Stream<UserModel?> get userStreamData => userStream.stream;


  Future<UserModel> authenticate(UserModel userModel) async {
    http.Response response = await _httpService.post(userModel.toJson(), "/login");
    var result  = json.decode(response.body);
    var jsonResponse = result["user"];
    return UserModel.fromJson(jsonResponse);
  }

  Future<UserModel> thirdPartyAuthenticate(UserModel userModel) async {
    http.Response response = await _httpService.post(userModel.toJson(), "/third-party");
    var result  = json.decode(response.body);
    var jsonResponse = result["user"];
    return UserModel.fromJson(jsonResponse);
  }

}