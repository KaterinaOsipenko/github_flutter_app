import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/domain/repositories/api_repository.dart';
import 'package:github_search_app/utils/constants.dart';

class ApiRepositoryImpl implements ApiRepository {
  final Dio _dio;

  ApiRepositoryImpl(this._dio);
  @override
  Future<List<Repository>> getRepos(
      {required String searchValue, required int pageValue}) async {
    print(searchValue);
    print('api');
    List<Repository> repoList = [];

    try {
      final response = await _dio.get(baseUrl,
          queryParameters: <String, dynamic>{
            searchInput: searchValue,
            perPage: perPageItems,
            page: pageValue
          });

      if (response.statusCode == 200) {
        print(response.statusCode);

        var list = response.data['items'] as List;
        print(list);
        repoList = list.map((e) => Repository.fromJson(e)).toList();
        print(repoList.first.name);
      } else {
        throw Exception('Faled to load data');
      }
    } on DioError catch (e) {
      throw Exception('Faled to load data');
    }
    return repoList;
  }
}