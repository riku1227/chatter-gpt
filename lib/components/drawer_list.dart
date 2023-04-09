import 'package:chatter_gpt/l10n/l10n.dart';
import 'package:chatter_gpt/model/chat_memory_model.dart';
import 'package:chatter_gpt/page/main_page.dart';
import 'package:chatter_gpt/page/settings_page.dart';
import 'package:chatter_gpt/provider/chat_memory_list_provider.dart';
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
    final chatMemoryListNotifier =
        ref.watch(chatMemoryListNotiferProvider.notifier);
    final chatMemoryListProvider = ref.watch(chatMemoryListNotiferProvider);

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
            : const SizedBox(),

        ListTile(
          leading: const Icon(Icons.add),
          title: Text(l10n.drawer_tile_add_chat_session),
          onTap: () {
            chatMemoryListNotifier.addChatMemory(
                ChatMemoryModelNotifer(ChatMemoryModel()), ref);
          },
        ),

        const Divider(),

        ListView.builder(
          shrinkWrap: true,
          itemCount: chatMemoryListProvider.length,
          itemBuilder: (context, index) {
            final chatMemory = ref.watch(chatMemoryListProvider[index]);
            final memoryName = chatMemory.memoryName ?? "Session: $index";
            return ListTile(
              title: Text(memoryName),
              onTap: () {
                ref.read(currentMemoryIndexProvider.notifier).state = index;
              },
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(l10n.dialog_delete_chat_session_title),
                        content: Text(l10n
                            .dialog_delete_chat_session_message(memoryName)),
                        actions: [
                          TextButton(
                            child: Text(l10n.message_cancel),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text(l10n.dialog_delete_chat_session_ok),
                            onPressed: () {
                              chatMemoryListNotifier.removeChatMemoryAtIndex(
                                  index, ref);
                              ref
                                  .read(currentMemoryIndexProvider.notifier)
                                  .state = 0;
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
            );
          },
        ),

        const Divider(),

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
