import 'package:flutter/material.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/markdown.dart';

/// チャット形式で文字列をマークダウンで表示するウィジェット
class ChatCard extends StatelessWidget {
  /// チャットに表示するコンテンツ (マークダウン)
  final String content;

  /// チャットの背景色の設定
  /// trueだった場合、テーマカラーの色で、falseだった場合はグレーっぽい色になる
  final bool isAccentColor;

  const ChatCard({Key? key, required this.content, required this.isAccentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: isAccentColor
          ? null
          : Theme.of(context).colorScheme.onPrimaryContainer,
      child: MarkdownWidget(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        data: content,
        config: MarkdownConfig.darkConfig,
      ),
    );
  }
}
