import 'package:chatter_gpt/components/chat_screen.dart';
import 'package:chatter_gpt/components/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/dialog/api_key_input_dialog.dart';

import '../provider/settings_provider.dart';

class MyHomePage extends ConsumerWidget with WidgetsBindingObserver {
  MyHomePage({Key? key}) : super(key: key);

  /// APIキーを取得してセットする
  getAPIKey(BuildContext context, WidgetRef ref) async {
    /// APIキーのStateを取得
    final settingsState = ref.read(settingsProvider.notifier);
    if (!settingsState.isLoaded) {
      /// 設定がまだ読み込まれていない場合は設定を読み込ませる
      await settingsState.loadSettings();
    }

    /// APIキーのStateにAPIキーが既にセットされてたら処理を終了する
    if (settingsState.getAPIKey().isNotEmpty) {
      return true;
    }

    /// マウントされてるか確認しとかないと警告でるから確認
    if (context.mounted) {
      /// APIキーを入力するダイアログを表示する
      var result = await showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (_) => ApiKeyInputDialog());

      /// 結果がnull以外だったらAPIキーをセットする
      if (result != null) {
        await settingsState.setAPIKey(result);
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 画面幅によって表示するウィジェットを変更するため、リストを作成する。
        final rowChildList = <Widget>[];
        if (constraints.maxWidth > 600) {
          rowChildList.add(const SizedBox(
            width: 240,
            child: DrawerList(),
          ));
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Chatter GPT"),
          ),
          body: FutureBuilder(
            future: getAPIKey(context, ref),
            builder: (context, snapshot) {
              // APIキーが取得できるまでプログレスバーを表示する
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return Row(
                children: [
                  ...rowChildList,
                  Expanded(
                    child: ChatScreen(),
                  ),
                ],
              );
            },
          ),
          drawer: constraints.maxWidth < 600
              ? const Drawer(
                  child: DrawerList(),
                )
              : null,
        );
      },
    );
  }
}
