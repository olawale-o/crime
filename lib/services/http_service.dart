import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  static final http.Client client = http.Client();
  static const baseURI = 'http://10.0.2.2:3000/v1/api/';

  Future<http.Response> get(String endPoint, {String token = ''}) async {
    var url = Uri.parse("$baseURI$endPoint");
    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    };
    http.Response response = await client.get(url, headers: headers);
    return response;
  }

  Future<http.Response> post(map, String endPoint, {String token = ''}) async {
    var url = Uri.parse("$baseURI$endPoint");
    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    };
    http.Response response = await client.post(url, body: map, headers: headers);
    return response;
  }

}