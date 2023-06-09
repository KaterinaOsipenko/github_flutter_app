import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app/presentation/providers/history_msg.dart';

class DescriprionScreenWidget extends ConsumerWidget {
  const DescriprionScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final String content = ref.watch(historyMsgProvider);
    return Container(
      margin: EdgeInsets.only(
        left: mediaQuery.size.width * 0.07,
        bottom: mediaQuery.size.height * 0.025,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        content,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
