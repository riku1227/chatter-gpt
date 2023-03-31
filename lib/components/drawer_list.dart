import 'package:chatter_gpt/l10n/l10n.dart';
import 'package:chatter_gpt/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerList extends ConsumerWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    return ListView(
      children: [
        /// 設定ページ
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(l10n.drawer_tile_settings),
          onTap: () {
            Navigator.push(context, SettingsPage.getRoute());
          },
        ),
      ],
    );
  }
}
