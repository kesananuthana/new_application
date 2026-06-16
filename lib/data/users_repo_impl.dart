import 'dart:convert';

import 'package:myapplication/domain/user_repo.dart';
import 'package:myapplication/models/user_model.dart';
import 'package:http/http.dart' as http;

class UsersRepoImpl implements UsersRepo {
  @override
  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = <UserModel>[];
    final response = await http.get(
      Uri.parse('https://fastapi-application-zc5o.onrender.com/employee'),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result['data'] != null) {
        users = (result['data'] as List)
            .map((json) => UserModel.fromJson(json))
            .toList();
      }
    }
    return users;
  }
}
