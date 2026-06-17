import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapplication/provider/user_provider.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersDataAsync = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: usersDataAsync.when(
        data: (user) {
          return ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('id : ${user[index].id}'),
                title: Text(user[index].email),
                trailing: Text(user[index].name),
              );
            },
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
