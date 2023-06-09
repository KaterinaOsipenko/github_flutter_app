import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/data/api_repository_impl.dart';
import 'package:github_search_app/domain/repositories/api_repository.dart';

final repositoryApiProvider = Provider<ApiRepository>(
    (ref) => ApiRepositoryImpl(ref.read(dioClientProvider)));

final dioClientProvider = Provider((ref) => Dio());
