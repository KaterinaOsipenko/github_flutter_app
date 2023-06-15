import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/config/router/app_route.gr.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.popAndPush(const HomeScreenRoute());
          },
        ),
        elevation: 5,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.33),
        title: const Center(child: Text(favTitleAppBar)),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
            ),
            child: const FavouriteRepositoriesListWidget(),
          ),
        ),
      ),
    );
  }
}
