import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/models/user.dart';

class ApiProvider {
  String baseUrl = "https://jsonplaceholder.typicode.com/users";
  final successCode = 200;

  Future<List<User>> fetchUsers() async {
    final response = await http.get(baseUrl);
    return parseUsers(response);
  }

  Future<User> fetchUserByID(String id) async {
    final response = await http.get(baseUrl + "?id=" + id);
    return parseUserByID(response);
  }

  List<User> parseUsers(http.Response response) {
    if (response.statusCode == successCode) {
      final List<User> users = (json.decode(response.body) as List)
          .map((i) => User.fromJson(i))
          .toList();
      return users;
    } else {
      throw Exception('failed to load users');
    }
  }

  User parseUserByID(http.Response response) {
    if (response.statusCode == successCode) {
      final List<User> users = (json.decode(response.body) as List)
          .map((i) => User.fromJson(i))
          .toList();
      return users[0];
    } else {
      throw Exception('failed to load user by id');
    }
  }
}
