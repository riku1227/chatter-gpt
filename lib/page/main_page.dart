import 'package:chatter_gpt/components/chat_screen.dart';
import 'package:chatter_gpt/components/dialog/text_input_dialog.dart';
import 'package:chatter_gpt/components/drawer_list.dart';
import 'package:chatter_gpt/l10n/l10n.dart';
import 'package:chatter_gpt/provider/chat_memory_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/dialog/api_key_input_dialog.dart';

import '../provider/settings_provider.dart';

final currentMemoryIndexProvider = StateProvider<int>((ref) => 0);

class MyHomePage extends ConsumerWidget with WidgetsBindingObserver {
  MyHomePage({Key? key}) : super(key: key);

  initSetup(BuildContext context, WidgetRef ref) async {
    await getAPIKey(context, ref);
    final memoryListNotiferProvider =
        ref.read(chatMemoryListNotiferProvider.notifier);

    if (!memoryListNotiferProvider.isLoaded) {
      await memoryListNotiferProvider.loadChatMemoryList(ref);
    }

    return true;
  }

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
    final l10n = L10n.of(context)!;

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
        return FutureBuilder(
          future: initSetup(context, ref),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            //メモリリストを取得する
            final chatMemoryListNotifier =
                ref.watch(chatMemoryListNotiferProvider.notifier);

            //現在選択されているメモリのインデックスを取得
            final currentMemoryIndex = ref.watch(currentMemoryIndexProvider);

            //メモリリストから現在選択されているメモリを取得
            final currentChatMemory = ref.watch(chatMemoryListNotifier
                .getChatMemoryAtIndex(currentMemoryIndex));
            final currentChatMemoryState = ref.watch(chatMemoryListNotifier
                .getChatMemoryAtIndex(currentMemoryIndex)
                .notifier);

            return Scaffold(
              appBar: AppBar(
                title: Text(
                    "Chatter GPT - ${currentChatMemory.memoryName ?? 'Session: $currentMemoryIndex'}"),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      // セッションの名前を変更するダイアログを表示する
                      final String? result = await showDialog(
                        context: context,
                        builder: (context) => TextInputDialog(
                          title: l10n.dialog_change_session_name_title,
                          textFieldHint:
                              l10n.dialog_change_session_name_textfield,
                          positiveButtonText:
                              l10n.dialog_change_session_name_ok,
                          negativeButtonText: l10n.message_cancel,
                          defaultValue: currentChatMemory.memoryName,
                        ),
                      );
                      if (result != null) {
                        currentChatMemoryState.setMemoryName(result);
                      }
                    },
                  )
                ],
              ),
              body: Row(
                children: [
                  ...rowChildList,
                  Expanded(
                    child: ChatScreen(
                      chatMemoryProvider: chatMemoryListNotifier
                          .getChatMemoryAtIndex(currentMemoryIndex),
                    ),
                  ),
                ],
              ),
              drawer: constraints.maxWidth < 600
                  ? const Drawer(
                      child: DrawerList(
                        isHeader: true,
                      ),
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}
