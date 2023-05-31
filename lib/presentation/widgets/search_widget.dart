import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/presentation/providers/search_name.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void clearSearchField() {
    _searchController.clear();
    ref.read(searchNameProvider.notifier).state = _searchController.text;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: mediaQuery.size.height * 0.025,
          bottom: mediaQuery.size.height * 0.025,
        ),
        width: mediaQuery.size.width * 0.9,
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            suffix: IconButton(
              visualDensity: const VisualDensity(vertical: -4),
              onPressed: clearSearchField,
              icon: const Icon(
                Icons.cancel_outlined,
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
            ),
            hintText: 'Search',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          onChanged: (value) =>
              ref.read(searchNameProvider.notifier).state = value,
        ),
      ),
    );
  }
}
