import 'package:flutter/material.dart';
import 'package:github_search_app/presentation/widgets/search_widget.dart';

import 'package:github_search_app/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.33),
        title: const Center(child: Text(titleAppBar)),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: mediaQuery.size.width * 0.02,
            ),
            width: mediaQuery.size.width * 0.1,
            height: mediaQuery.size.height * 0.05,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.star,
                  color: Theme.of(context).colorScheme.background),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
        child: Column(children: [SearchWidget()]),
      )),
    );
  }
}
