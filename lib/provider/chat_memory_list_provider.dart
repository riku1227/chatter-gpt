import 'package:chatter_gpt/model/chat_memory_model.dart';
import 'package:chatter_gpt/repository/chat_session_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMemoryListNotifier extends StateNotifier<
    List<StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>>> {
  //初期状態として、チャットセッションを一つ作成しておく
  ChatMemoryListNotifier() : super([]);

  var _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> loadChatMemoryList(WidgetRef ref) async {
    final sessionIdList = await ChatSessionRepository.readSessionIdList();
    if (sessionIdList.isNotEmpty) {
      final List<StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>>
          memoryList = [];
      for (var memoryId in sessionIdList) {
        final session = await ChatSessionRepository.readSessionById(memoryId);
        if (session != null) {
          memoryList.add(
            StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>(
              (ref) => ChatMemoryModelNotifer(
                session,
              ),
            ),
          );
        }
      }
      state = memoryList;
    }

    if (state.isEmpty) {
      state = [
        StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>(
          (ref) => ChatMemoryModelNotifer(
            ChatMemoryModel(),
          ),
        ),
      ];
      await writeToFile(ref);
    }

    _isLoaded = true;
  }

  // チャットメモリを追加する
  void addChatMemory(ChatMemoryModelNotifer notifer, WidgetRef ref) async {
    var provider =
        StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>(
            (ref) => notifer);

    state = [...state, provider];
    await writeToFile(ref);
  }

  // 指定されたインデックスのチャットメモリを削除する
  void removeChatMemoryAtIndex(int index, WidgetRef ref) async {
    ChatSessionRepository.removeSessionById(ref.read(state[index]).uuid!);

    state.removeAt(index);
    state = [...state];

    await writeToFile(ref);
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

  Future<void> writeToFile(WidgetRef ref) async {
    final List<String> sessionIdList = [];
    for (var element in state) {
      sessionIdList.add(ref.read(element).uuid!);
    }

    await ChatSessionRepository.writeSessionIdList(sessionIdList);
  }
}

// StateNotifierProviderを作成する
final chatMemoryListNotiferProvider = StateNotifierProvider<
        ChatMemoryListNotifier,
        List<StateNotifierProvider<ChatMemoryModelNotifer, ChatMemoryModel>>>(
    (ref) => ChatMemoryListNotifier());
