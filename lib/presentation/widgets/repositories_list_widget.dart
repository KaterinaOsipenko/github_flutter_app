import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/get_repos.dart';
import 'package:github_search_app/presentation/widgets/empty_search_widget.dart';
import 'package:github_search_app/presentation/widgets/repository_item.dart';
import 'package:github_search_app/utils/constants.dart';

class RepositoriesListWidget extends ConsumerStatefulWidget {
  const RepositoriesListWidget({
    super.key,
  });

  @override
  ConsumerState<RepositoriesListWidget> createState() =>
      _RepositoriesListWidgetState();
}

class _RepositoriesListWidgetState
    extends ConsumerState<RepositoriesListWidget> {
  late ScrollController controller;
  late AsyncValue<List<Repository>> repositoryList;
  int page = 1;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(scrollListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      loadMoreRepositories(ref);
    }
  }

  void loadMoreRepositories(WidgetRef ref) {
    page = page + 1;

    repositoryList = ref.watch(repositoriesListProvide(page));
  }

  @override
  Widget build(BuildContext context) {
    repositoryList = ref.watch(repositoriesListProvide(page));

    return repositoryList.when(error: ((error, stackTrace) {
      return const EmptySearchWidget(content: negativeResult);
    }), loading: () {
      return CircularProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.primary,
      );
    }, data: (repositoryList) {
      return repositoryList.isEmpty
          ? const EmptySearchWidget(content: negativeResult)
          : Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  controller: controller,
                  itemCount: repositoryList.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RepositoryItem(
                      repository: repositoryList[index],
                    );
                  },
                ),
              ),
            );
    });
  }
}
