import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  final String content;
  const EmptySearchWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(content),
    );
  }
}
