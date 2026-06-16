import 'package:myapplication/models/user_model.dart';

abstract class UsersRepo {
  Future<List<UserModel>> getUsers();
}
