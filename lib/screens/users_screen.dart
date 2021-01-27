import 'package:flutter/material.dart';
import 'package:test_app/widgets/users_item.dart';
import 'package:test_app/blocs/users_bloc.dart';
import 'package:test_app/models/user.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text('list of users'.toUpperCase()),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: bloc.users,
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return buildUsersList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildUsersList(AsyncSnapshot<List<User>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        User user = snapshot.data[index];
        return UsersItem(
          user: user,
        );
      },
    );
  }
}
