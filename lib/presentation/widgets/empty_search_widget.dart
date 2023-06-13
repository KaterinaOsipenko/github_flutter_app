import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  final String content;
  const EmptySearchWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.55,
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
