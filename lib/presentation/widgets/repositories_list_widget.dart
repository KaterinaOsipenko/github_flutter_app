import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/get_repos.dart';
import 'package:github_search_app/presentation/widgets/repository_item.dart';

class RepositoriesListWidget extends ConsumerStatefulWidget {
  const RepositoriesListWidget({super.key});

  @override
  ConsumerState<RepositoriesListWidget> createState() =>
      _RepositoriesListWidgetState();
}

class _RepositoriesListWidgetState
    extends ConsumerState<RepositoriesListWidget> {
  @override
  Widget build(BuildContext context) {
    int page = 1;
    AsyncValue<List<Repository>> reposList =
        ref.watch(repositoriesListProvide(page));

    return reposList.when(
      error: ((error, stackTrace) => Text(stackTrace.toString())),
      loading: () {
        return CircularProgressIndicator(
          backgroundColor: Theme.of(context).colorScheme.primary,
        );
      },
      data: (reposList) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return RepositoryItem(
                repository: reposList[index],
              );
            },
            itemCount: reposList.length,
          ),
        );
      },
    );
  }
}
