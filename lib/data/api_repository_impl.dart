import 'package:dio/dio.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/domain/repositories/api_repository.dart';
import 'package:github_search_app/utils/constants.dart';

/// class for working with api with dio
class ApiRepositoryImpl implements ApiRepository {
  final Dio _dio;

  ApiRepositoryImpl(this._dio);

  /// get repositories by query and page
  /// query example: https://api.github.com/search/repositories?q=${searchValue}&per_page=${page}
  @override
  Future<List<Repository>> getRepos(
      {required String searchValue, required int pageValue}) async {
    List<Repository> repoList = [];

    try {
      final response =
          await _dio.get(baseUrl, queryParameters: <String, dynamic>{
        searchInput: searchValue,
        perPage: perPageItems * pageValue,
      });

      if (response.statusCode == 200) {
        var list = response.data['items'] as List;

        repoList = list.map((e) => Repository.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
    return repoList;
  }
}
