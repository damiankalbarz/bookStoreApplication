import 'dart:convert';
import 'dart:io';

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

  Future<void> postBook() async {
    try {
      Book book = Book(
        id: 5,
        title: "tttt",
        author: "ttt",
        category: "hhh",
        description: "jjj",
        price: 15,
      );
      var response = await _dio.post(
        'http://localhost:9191/addBooks',
        data: book.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type to JSON
          },
        ),
      );

      if (response.statusCode == 200) {
        print('classes add successfully');
      } else {
        print('classes add failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw ('Error during change classes: $e');
    }
  }
}
