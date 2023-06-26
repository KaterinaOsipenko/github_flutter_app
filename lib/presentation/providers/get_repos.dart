import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/api_provider.dart';
import 'package:github_search_app/presentation/providers/search_name.dart';

/// provider for repository list by watching on seatch input value
final repositoriesListProvide = FutureProvider.family<List<Repository>, int>(
  (ref, page) {
    var name = ref.watch(searchNameProvider);

    return ref
        .read(repositoryApiProvider)
        .getRepos(searchValue: name, pageValue: page);
  },
);
