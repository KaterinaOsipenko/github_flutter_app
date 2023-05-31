import 'package:auto_route/auto_route.dart';

import 'package:github_search_app/presentation/screens/home_screen.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
  ],
)
class $AppRouter {}
