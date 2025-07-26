import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/auth_model.dart';

class AuthRepo{

  final String url = "https://dummyjson.com/auth/login";

  Future <AuthModel> login(String username, String password) async {
    print(username);
    print(password);
    final response = await http.post( Uri.parse(url),
    headers: {
      "Content-Type": "application/json"
    },
    body:  jsonEncode({
      "username": username.toString(),
      "password": password.toString(),
    })
    );
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200){
      print(response.statusCode);
      print(response.body);
      print("dhdbhdb");
      return AuthModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Something went wrong");
    }
  }

}