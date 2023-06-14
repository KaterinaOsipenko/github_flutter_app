import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/presentation/widgets/fav_repositories_list_widget.dart';
import 'package:github_search_app/utils/constants.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.33),
        title: const Center(child: Text(favTitleAppBar)),
      ),
      body: const FavouriteRepositoriesListWidget(),
    );
  }
}
