import 'package:github_search_app/domain/models/repository.dart';

/// abstract class for api
abstract class ApiRepository {
  Future<List<Repository>> getRepos(
      {required String searchValue, required int pageValue});
}
