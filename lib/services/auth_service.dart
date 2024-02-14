import 'dart:convert';
import 'package:bookstore/TokenStorage.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthService{

  Future<bool> login(String username, String password) async {

    const baseURL = "http://localhost:8080/login";
    const token = "dd";
    try {
      print("xdd");
      var response = await http.post(
        Uri.parse(baseURL),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'accept': '*/*',
          },
        body: json.encode({
          'username': username,
          'password': password,})
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        final tokenStorage = TokenStorage();
        var token = json.decode(response.body)['token'];
        print(token);
        await tokenStorage.saveToken(token);

        return true;
      } else {
        print("Server response: ${response.statusCode}");
        print("Response data: ${response.body}");
        throw Exception(
            "Failed to load books. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
      throw Exception("Failed to load books. Error: $e");
    }
  }
}