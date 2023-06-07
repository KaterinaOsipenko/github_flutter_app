import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/presentation/providers/search_name.dart';
import 'package:github_search_app/presentation/widgets/empty_search_widget.dart';
import 'package:github_search_app/presentation/widgets/repositories_list_widget.dart';
import 'package:github_search_app/presentation/widgets/search_widget.dart';

import 'package:github_search_app/utils/constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var name = ref.watch(searchNameProvider);
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
          child: Column(children: [
        const SearchWidget(),
        Container(
          margin: EdgeInsets.only(
            left: mediaQuery.size.width * 0.07,
            bottom: mediaQuery.size.height * 0.025,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            'Search History',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        name.isEmpty
            ? const EmptySearchWidget()
            : const RepositoriesListWidget(),
      ])),
    );
  }
}
