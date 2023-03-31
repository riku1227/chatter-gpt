import 'package:chatter_gpt/l10n/l10n.dart';
import 'package:chatter_gpt/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerList extends ConsumerWidget {
  const DrawerList({Key? key, this.isHeader = false}) : super(key: key);

  /// Drawer Headerを表示するかどうか
  /// 横画面レイアウトの時にヘッダーは要らないが、縦画面レイアウトのときは欲しいので
  final bool isHeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    return ListView(
      children: [
        isHeader
            ? DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 42,
                      height: 42,
                      child: FlutterLogo(),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Chatter GPT"),
                        Text("v0.0.0"),
                      ],
                    ),
                  ],
                ),
              )
            : const Divider(),

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
