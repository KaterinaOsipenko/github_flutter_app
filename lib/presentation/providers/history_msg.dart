import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/presentation/providers/get_repos.dart';
import 'package:github_search_app/presentation/providers/search_name.dart';

import 'package:github_search_app/utils/constants.dart';

final historyMsgProvider = Provider<String>((ref) {
  var searchInput = ref.watch(searchNameProvider);
  var historyMsg = '';
  if (searchInput.isEmpty) {
    historyMsg = history;
  } else {
    var reposList = ref.watch(repositoriesListProvide(1));
    if (reposList.value!.isEmpty) {
      historyMsg = whatFountNegative;
    } else if (reposList.value!.isNotEmpty) {
      historyMsg = whatFountPositive;
    }
  }
  return historyMsg;
});
