import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<User> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.43.242:3000/users'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'phone': user.phone,
        }),
      );

      if (response.statusCode == 201) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
