import 'package:flutter/material.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/widgets/repository_item.dart';

class RepositoriesListWidget extends StatelessWidget {
  final List<Repository> reposList;
  const RepositoriesListWidget({super.key, required this.reposList});

  @override
  Widget build(BuildContext context) {
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
  }
}
