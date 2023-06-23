import 'package:flutter/material.dart';
import 'package:github_search_app/utils/constants.dart';

class EmptySearchWidget extends StatelessWidget {
  final String content;
  const EmptySearchWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return content == noFavouriteRepos
        ? SizedBox(
            width: mediaQuery.size.width * 0.5,
            child: Center(
              child: Text(
                content,
                textAlign: TextAlign.center,
              ),
            ),
          )
        : Container(
            width: mediaQuery.size.width * 0.5,
            margin: EdgeInsets.only(top: mediaQuery.size.height * 0.2),
            child: Center(
              child: Text(
                content,
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
