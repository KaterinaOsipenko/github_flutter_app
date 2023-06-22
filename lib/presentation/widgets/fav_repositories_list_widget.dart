import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/fav_repositories.dart';
import 'package:github_search_app/presentation/widgets/empty_search_widget.dart';
import 'package:github_search_app/presentation/widgets/repository_item.dart';
import 'package:github_search_app/utils/constants.dart';

class FavouriteRepositoriesListWidget extends ConsumerWidget {
  const FavouriteRepositoriesListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Repository> repositoryList =
        ref.watch(favRepositoryProvider.notifier).getFavRepositories();
    return repositoryList.isEmpty
        ? const EmptySearchWidget(content: noFavouriteRepos)
        : ListView.builder(
            itemBuilder: (context, index) {
              return RepositoryItem(
                repository: repositoryList[index],
              );
            },
            itemCount: repositoryList.length,
          );
  }
}
