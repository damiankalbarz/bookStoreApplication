import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/auth_service.dart';



class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}




class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthService _authService = AuthService();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child:SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                const Text("Login to bookStore", style: TextStyle(fontSize: 32),),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                TextFormField(
                  controller: emailController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Adres email',
                      labelStyle: TextStyle(
                        fontFamily: "Bellota-Regular",
                      )),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Hasło',
                      labelStyle: TextStyle(fontFamily: "Bellota-Regular")),
                  obscureText: true,
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    _authService.login(emailController.text, passwordController.text);
                  },
                  child: const Text('Zaloguj się',
                      style: TextStyle(fontFamily: "Bellota-Regular")),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ()
                      ),
                    );*/
                  },
                  child: const Text(
                    'Nie masz jeszcze konta? Zarejestruj się',
                    style: TextStyle(
                        fontFamily: "Bellota-Regular",
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
