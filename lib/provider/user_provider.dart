import 'package:myapplication/data/users_repo_impl.dart';
import 'package:riverpod/riverpod.dart';

final userProvider = FutureProvider((ref) {
  final UsersRepoImpl usersRepo = UsersRepoImpl();
  return usersRepo.getUsers();
});
