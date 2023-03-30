import 'dart:convert';

import 'package:chatter_gpt/components/widget/chat_card.dart';
import 'package:chatter_gpt/model/secret_box_model.dart';
import 'package:chatter_gpt/repository/preference_repository.dart';
import 'package:cryptography/cryptography.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/dialog/api_key_input_dialog.dart';
import '../provider/api_key_provider.dart';

/// チャットTextFieldのコントローラーのプロバイダー
final chatControllerProvider = StateProvider(
    name: "chatControllerProvider", (ref) => TextEditingController());

/// チャットメモリのプロバイダー
final chatMemoryProvider =
    StateProvider<List<OpenAIChatCompletionChoiceMessageModel>>((ref) => []);

class MyHomePage extends ConsumerWidget with WidgetsBindingObserver {
  MyHomePage({Key? key}) : super(key: key);

  var isEnter = false;

  /// APIキーを取得してセットする
  getAPIKey(BuildContext context, WidgetRef ref) async {
    /// APIキーのStateを取得
    final apiKeyState = ref.read(apiKeyProvider.notifier);

    /// APIキーのStateにAPIキーが既にセットされてたら処理を終了する
    if (apiKeyState.getAPIKey().isNotEmpty) {
      return true;
    }

    String? apiKey = await PreferenceRepository.getOpenAIAPIKey();

    /// PreferencesにAPIキーが存在したらAPIキーをセットして処理を終了する
    if (apiKey != null) {
      apiKeyState.setAPIKey(apiKey);
      return true;
    }

    /// マウントされてるか確認しとかないと警告でるから確認
    if (context.mounted) {
      /// APIキーを入力するダイアログを表示する
      var result = await showDialog<String>(
          context: context, builder: (_) => ApiKeyInputDialog());

      /// 結果がnull以外だったらAPIキーをセットする
      if (result != null) {
        apiKeyState.setAPIKey(result);
        await PreferenceRepository.setOpenAIAPIKey(result);
      }
    }
    return true;
  }

  /// チャットを送信してチャットメモリにその内容を追加する
  postChat(WidgetRef ref) async {
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
      OpenAIChatCompletionModel chatResponse =
          await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo",
        messages: chatMemoryState.state,
      );

      // チャットメモリに返ってきたメッセージを追加
      chatMemoryState.state = [
        ...chatMemoryState.state,
        chatResponse.choices[0].message
      ];
    } catch (e) {
      // エラーが発生した場合はエラーメッセージををチャットメモリに追加する
      chatMemoryState.state = [
        ...chatMemoryState.state,
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.assistant,
          content: "エラーが発生しました\n${e.toString()}",
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMemory = ref.watch(chatMemoryProvider);
    final chatMemoryState = ref.watch(chatMemoryProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Chatter GPT"),
        ),
        body: FutureBuilder(
            future: getAPIKey(context, ref),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Text("Loading...");
              }

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
                              if (value
                                      .isKeyPressed(LogicalKeyboardKey.enter) &&
                                  !value.isShiftPressed) {
                                isEnter = true;
                                await postChat(ref);
                              }
                            },
                            child: TextField(
                                minLines: 1,
                                maxLines: 2,
                                decoration: const InputDecoration(
                                  hintText: "チャットをここに入力",
                                ),
                                controller: ref.watch(chatControllerProvider),
                                onChanged: (value) {
                                  if (isEnter) {
                                    ref
                                        .read(chatControllerProvider.notifier)
                                        .state
                                        .text = "";
                                    isEnter = false;
                                  }
                                }),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () async {
                            await postChat(ref);
                          },
                          icon: const Icon(Icons.send),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
