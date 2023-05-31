import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/data/api_repository_impl.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/search_name.dart';

final getReposProveder = FutureProvider((ref) {
  final name = ref.watch(searchNameProvider);
  return ApiRepositoryImpl(Dio()).getRepos(searchValue: name, pageValue: 1);
});
