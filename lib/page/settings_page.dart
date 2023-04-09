import 'package:chatter_gpt/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/dialog/api_key_input_dialog.dart';
import '../l10n/l10n.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  /// Navigator用のRouteを取得する
  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const SettingsPage();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider.notifier);
    //設定
    final l10n = L10n.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings_title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.settings_tile_general_settings),
          ),
          ListTile(
            leading: const Icon(Icons.vpn_key),
            title: Text(l10n.settings_change_api_key),
            onTap: () async {
              final response = await showDialog<String?>(
                  context: context, builder: (_) => ApiKeyInputDialog());
              if (response != null) {
                await settingsState.setAPIKey(response);
              }
            },
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.settings_tile_other_settings),
          ),
          ListTile(
              leading: const Icon(Icons.info),
              title: Text(l10n.settings_application_info),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: const SizedBox(
                    width: 48,
                    height: 48,
                    child: FlutterLogo(),
                  ),
                );
              })
        ],
      ),
    );
  }
}
