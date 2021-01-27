import 'package:flutter/material.dart';
import 'package:test_app/widgets/app_text.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/screens/user_profile.dart';

class UsersItem extends StatelessWidget {
  final User user;

  const UsersItem({@required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserProfilePage(id: user.id.toString()),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              title: 'username',
              text: user.username,
            ),
            AppText(
              title: 'name',
              text: user.name,
            )
          ],
        ),
      ),
    );
  }
}
