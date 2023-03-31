import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import 'widget/chat_card.dart';

/// チャットTextFieldのコントローラーのプロバイダー
final chatControllerProvider = StateProvider(
    name: "chatControllerProvider", (ref) => TextEditingController());

/// チャットメモリのプロバイダー
final chatMemoryProvider =
    StateProvider<List<OpenAIChatCompletionChoiceMessageModel>>((ref) => []);

class ChatScreen extends ConsumerWidget {
  ChatScreen({Key? key}) : super(key: key);

  var isEnter = false;

  /// チャットを送信してチャットメモリにその内容を追加する
  postChat(WidgetRef ref, {required String errorMessage}) async {
    // チャットメモリのStateを取得
    var chatMemoryState = ref.watch(chatMemoryProvider.notifier);

    // 送信するメッセージを作成
    final messageModel = OpenAIChatCompletionChoiceMessageModel(
      role: OpenAIChatMessageRole.user,
      content: ref.read(chatControllerProvider).text,
    );

    // チャット内容を入力するTextFieldを空にする
    ref.read(chatControllerProvider.notifier).state.text = "";

    // チャットメモリに送信するメッセージを追加
    chatMemoryState.state = [...chatMemoryState.state, messageModel];

    try {
      // Chat GPT APIに送ってレスポンスを取得
      Stream<OpenAIStreamChatCompletionModel> chatStream =
          OpenAI.instance.chat.createStream(
        model: "gpt-3.5-turbo",
        messages: chatMemoryState.state,
      );

      var currentMessage = "";
      chatStream.listen((chatResponse) {
        final appendMessage = chatResponse.choices[0].delta.content;
        if (appendMessage == null) {
          return;
        }
        // まだメッセージが追加されていない状態の時はチャットメモリにメッセージモデルを追加する
        if (currentMessage.isEmpty) {
          chatMemoryState.state = [
            ...chatMemoryState.state,
            OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.assistant,
              content: "",
            )
          ];
        }

        // 新しく受け取ったメッセージを追加する
        currentMessage += appendMessage;

        /// 配列は配列ごと入れ替えないといけないので
        /// 更新中の最後の要素を一度削除して、新規で受け取った分を追加したメッセージモデルを作成しなおす
        chatMemoryState.state = [
          ...chatMemoryState.state.sublist(0, chatMemoryState.state.length - 1),
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.assistant,
            content: currentMessage,
          ),
        ];
      });
    } catch (e) {
      // エラーが発生した場合はエラーメッセージををチャットメモリに追加する
      chatMemoryState.state = [
        ...chatMemoryState.state,
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.assistant,
          content: "$errorMessage\n${e.toString()}",
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final chatMemory = ref.watch(chatMemoryProvider);
    final chatMemoryState = ref.watch(chatMemoryProvider.notifier);

    return Column(
      children: [
        Expanded(
          flex: 9,
          child: ListView.builder(
              itemCount: chatMemory.length,
              itemBuilder: (context, index) {
                final chat = chatMemory[index];

                var chatWidget = [
                  Flexible(
                    flex: 1,
                    child: ChatCard(
                      content: chat.content,
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                ];

                // ロールがユーザーだったら右側に表示するので配列を反転させる
                if (chat.role == OpenAIChatMessageRole.user) {
                  chatWidget = chatWidget.reversed.toList();
                }

                return Row(
                  children: chatWidget,
                );
              }),
        ),
        SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                tooltip: l10n.main_chat_clear_memory,
                onPressed: () {
                  chatMemoryState.state = [];
                },
                icon: const Icon(Icons.clear),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: RawKeyboardListener(
                  focusNode: FocusNode(),
                  onKey: (value) async {
                    if (value.isKeyPressed(LogicalKeyboardKey.enter) &&
                        !value.isShiftPressed) {
                      isEnter = true;
                      if (ref.watch(chatControllerProvider).text.isNotEmpty) {
                        await postChat(ref, errorMessage: l10n.error_message);
                      }
                    }
                  },
                  child: TextField(
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: l10n.main_chat_input_textfield,
                      ),
                      controller: ref.watch(chatControllerProvider),
                      onChanged: (value) {
                        if (isEnter) {
                          ref.read(chatControllerProvider.notifier).state.text =
                              "";
                          isEnter = false;
                        }
                      }),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () async {
                  await postChat(ref, errorMessage: l10n.error_message);
                },
                tooltip: l10n.main_chat_send,
                icon: const Icon(Icons.send),
              )
            ],
          ),
        ),
      ],
    );
  }
}
