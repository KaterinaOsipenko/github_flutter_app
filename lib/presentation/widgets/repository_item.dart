import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/domain/models/repository.dart';
import 'package:github_search_app/presentation/providers/fav_repositories.dart';

class RepositoryItem extends ConsumerStatefulWidget {
  final Repository repository;
  const RepositoryItem({super.key, required this.repository});

  @override
  ConsumerState<RepositoryItem> createState() => _RepositoryItemState();
}

class _RepositoryItemState extends ConsumerState<RepositoryItem> {
  @override
  Widget build(BuildContext context) {
    void onToggleFavourite(bool value) {
      print('toggle fav $value');
      setState(
        () {
          widget.repository.isFavourite = value;
          value
              ? ref.read(favRepositoryProvider).add(widget.repository)
              : ref.read(favRepositoryProvider).remove(widget.repository);
        },
      );
    }

    return ListTile(
      leading: Text(
        widget.repository.name,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      trailing: widget.repository.isFavourite == true
          ? IconButton(
              onPressed: () {
                onToggleFavourite(false);
              },
              icon: Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : IconButton(
              onPressed: () {
                onToggleFavourite(true);
              },
              icon: Icon(Icons.star_border,
                  color: Theme.of(context).colorScheme.primary),
            ),
    );
  }
}
