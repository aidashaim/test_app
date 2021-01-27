import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String title;
  final String text;

  const AppText({@required this.title = '', this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            title != ''
                ? Text(title.toUpperCase() + ': ',
                    style: Theme.of(context).textTheme.headline1)
                : Container(),
            text != ''
                ? Flexible(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.headline1.merge(
                            TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
