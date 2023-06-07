import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';

final favRepositoryProvider =
    StateNotifierProvider<FavChangeNotifier, List<Repository>>(
        (ref) => FavChangeNotifier());

class FavChangeNotifier extends StateNotifier<List<Repository>> {
  FavChangeNotifier() : super([]);

  void addRepository(Repository repository) {
    state.add(repository);
  }

  void removeRepository(Repository repository) {
    state.remove(repository);
  }

  List<Repository> getFavRepositories() {
    return state;
  }
}
