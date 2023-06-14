import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/get_repos.dart';
import 'package:github_search_app/presentation/providers/search_name.dart';

import 'package:github_search_app/utils/constants.dart';

final historyMsgProvider = Provider<String>((ref) {
  var searchInput = ref.watch(searchNameProvider);
  var historyMsg = '';
  if (searchInput.isEmpty) {
    historyMsg = history;
  } else {
    AsyncValue<List<Repository>> reposList =
        ref.watch(repositoriesListProvide(1));
    var listRepos = reposList.value;
    if (listRepos != null) {
      if (listRepos.isEmpty) {
        historyMsg = whatFountNegative;
      } else if (listRepos.isNotEmpty) {
        historyMsg = whatFountPositive;
      }
    }
  }
  return historyMsg;
});
