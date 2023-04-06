import 'package:chatter_gpt/model/chat_memory_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMemoryListNotifier extends StateNotifier<
    List<StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>>> {
  //初期状態として、チャットセッションを一つ作成しておく
  ChatMemoryListNotifier()
      : super([
          StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>(
            (ref) => ChatMemoryModelNotifer(),
          )
        ]);

  // チャットメモリを追加する
  void addChatMemory(ChatMemoryModelNotifer notifer) {
    var provider =
        StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>(
            (ref) => notifer);

    state = [...state, provider];
  }

  // 指定されたインデックスのチャットメモリを削除する
  void removeChatMemoryAtIndex(int index) {
    state.removeAt(index);
    state = [...state];
  }

  // 指定されたインデックスのチャットメモリのプロバイダーを取得する
  StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>
      getChatMemoryAtIndex(int index) {
    return state[index];
  }

  // チャットメモリのリストを取得する
  List<StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>>
      getMemoryList() {
    return state;
  }

  // チャットメモリのリストのサイズを取得する
  int getMemoryListSize() {
    return state.length;
  }
}

// StateNotifierProviderを作成する
final chatMemoryListNotiferProvider = StateNotifierProvider<
        ChatMemoryListNotifier,
        List<StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>>>(
    (ref) => ChatMemoryListNotifier());
