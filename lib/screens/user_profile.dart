import 'package:flutter/material.dart';
import 'package:test_app/blocs/users_bloc.dart';
import 'package:test_app/widgets/app_text.dart';
import 'package:test_app/models/user.dart';

class UserProfilePage extends StatelessWidget {
  final String id;

  const UserProfilePage({@required this.id});

  Widget getWorkingInfo(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'working',
          text: '',
        ),
        Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: 'name',
                  text: user.company.name,
                ),
                AppText(
                  title: 'bs',
                  text: user.company.bs,
                ),
                AppText(
                  title: 'catchPhrase',
                  text: user.company.catchPhrase,
                ),
              ],
            ))
      ],
    );
  }

  Widget getMainInfo(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'name',
          text: user.name,
        ),
        AppText(
          title: 'email',
          text: user.email,
        ),
        AppText(
          title: 'phone',
          text: user.phone,
        ),
        AppText(
          title: 'website',
          text: user.website,
        ),
        getWorkingInfo(user),
        AppText(
          title: 'address',
          text: user.getAddress(),
        )
      ],
    );
  }

  Widget buildUser(AsyncSnapshot<User> snapshot) {
    User user = snapshot.data;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getMainInfo(user),
        getWorkingInfo(user),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchUserByID(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('user profile'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: StreamBuilder(
            stream: bloc.userByID,
            builder: (context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                return buildUser(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
