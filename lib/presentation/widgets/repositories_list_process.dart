import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/widgets/empty_search_widget.dart';
import 'package:github_search_app/presentation/widgets/repositories_list_widget.dart';

class RepositoriesListProcess extends StatelessWidget {
  final AsyncValue<List<Repository>> repositoryList;
  const RepositoriesListProcess({super.key, required this.repositoryList});

  @override
  Widget build(BuildContext context) {
    return repositoryList.when(
      error: ((error, stackTrace) {
        return const EmptySearchWidget(content: 'Error');
      }),
      loading: () {
        return CircularProgressIndicator(
          backgroundColor: Theme.of(context).colorScheme.primary,
        );
      },
      data: (repositoryList) {
        return RepositoriesListWidget(reposList: repositoryList);
      },
    );
  }
}
