import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Book.dart';



class BookService {
  final Dio _dio = Dio();

/*
  Future<List<Book>> getBooks() async {
    const baseURL = "http://localhost:8080/books";

    try {
      List<Book> bookList;

      Response response = await Dio().get(baseURL);

      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        print("jsonResponse: $jsonResponse");

        bookList = List<Book>.from(jsonResponse.map((item) => Book.fromJson(item)));
        return bookList;
      } else {
        print("Server response: ${response.statusCode}");
        print("Response data: ${response.data}");
        throw Exception("Failed to load books. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
      throw Exception("Failed to load books. Error: $e");
    }
  }

 */
/*
  Future<List<Book>> getBooks() async {
    const baseURL = "http://localhost:8080/api/books";
    try {
      List<Book> bookList;
      final Response response = await _dio.get(baseURL);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.data);
        print("jsonResponse");
        bookList = List<Book>.from(jsonResponse.map((item) => Book.fromJson(item)));
        return bookList;
      }
      else {
        print("Server response: ${response.statusCode}");
        print("Response data: ${response.data}");
        throw Exception("Failed to load books. Status code: ${response.statusCode}");
      }
    }
    catch (e) {
      print('Error: $e');
      throw Exception("Failed to load books. Error: $e");
    }
  }


*/
  Future<List<Book>> getBooks() async {
    const baseURL = "http://localhost:8080/api/books";
    try {
      List<Book> bookList;
      var response = await http.get(
        Uri.parse(baseURL),
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        bookList =
            List<Book>.from(jsonResponse.map((item) => Book.fromJson(item)));
        return bookList;
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

  Future<Book> getBook(int id) async {
    const baseURL = "http://localhost:8080/api/book/";
    try {
      List<Book> bookList;
      print("xdddg");
      var response = await http.get(
        Uri.parse(baseURL+id.toString()),
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        Book book = Book.fromJson(jsonResponse);
        return book;
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


  Future<void> addLike(int id) async {
    const baseURL = "http://localhost:8080/api/likeBook/";
    try {
           var response = await http.post(
        Uri.parse(baseURL+id.toString()),
      );
      if (response.statusCode == 200) {

        print("like");
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

  Future<void> addHate(int id) async {
    const baseURL = "http://localhost:8080/api/hateBook/";
    try {
      var response = await http.post(
        Uri.parse(baseURL + id.toString()),
      );
      if (response.statusCode == 200) {
        print("hate");
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
