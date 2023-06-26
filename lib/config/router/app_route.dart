import 'package:auto_route/auto_route.dart';
import 'package:github_search_app/presentation/screens/favourite_screen.dart';

import 'package:github_search_app/presentation/screens/home_screen.dart';

/// navigation
@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: FavouriteScreen),
  ],
)
class $AppRouter {}
