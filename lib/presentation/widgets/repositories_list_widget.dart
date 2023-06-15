import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/get_repos.dart';
import 'package:github_search_app/presentation/widgets/empty_search_widget.dart';
import 'package:github_search_app/presentation/widgets/repository_item.dart';

class RepositoriesListWidget extends ConsumerWidget {
  int page;
  late AsyncValue<List<Repository>> repositoryList;
  RepositoriesListWidget({super.key, this.page = 1});

  loadMoreRepositories(DragDownDetails details, WidgetRef ref) {
    page = page + 1;

    repositoryList = ref.watch(repositoriesListProvide(page));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    repositoryList = ref.watch(repositoriesListProvide(page));
    return repositoryList.when(error: ((error, stackTrace) {
      return const EmptySearchWidget(content: 'Error');
    }), loading: () {
      return CircularProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.primary,
      );
    }, data: (repositoryList) {
      return GestureDetector(
        onVerticalDragDown: (details) => loadMoreRepositories(details, ref),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.70,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return RepositoryItem(
                repository: repositoryList[index],
              );
            },
            itemCount: repositoryList.length,
          ),
        ),
      );
    });
  }
}
