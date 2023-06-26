import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/data/api_repository_impl.dart';
import 'package:github_search_app/domain/repositories/api_repository.dart';

/// provider for api
final repositoryApiProvider = Provider<ApiRepository>(
    (ref) => ApiRepositoryImpl(ref.read(dioClientProvider)));

/// provider for dio
final dioClientProvider = Provider((ref) => Dio());
