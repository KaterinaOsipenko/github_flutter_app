import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/get_repos.dart';

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
    AsyncValue<List<Repository>> reposList = ref.watch(getReposProveder);
    return reposList.when(
      error: ((error, stackTrace) => Text(stackTrace.toString())),
      loading: () {
        return CircularProgressIndicator(
          backgroundColor: Theme.of(context).colorScheme.primary,
        );
      },
      data: (reposList) {
        if (reposList.isEmpty) {
          return const Center(
            child: Text('No repos.'),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(reposList[index].name),
              );
            },
            itemCount: reposList.length,
          ),
        );
      },
    );
  }
}
