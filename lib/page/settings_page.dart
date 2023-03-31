import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    //設定
    final l10n = L10n.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
