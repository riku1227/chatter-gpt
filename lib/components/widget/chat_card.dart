import 'package:flutter/material.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/markdown.dart';

/// チャット形式で文字列をマークダウンで表示するウィジェット
class ChatCard extends StatelessWidget {
  final String content;

  const ChatCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: MarkdownWidget(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        data: content,
        config: MarkdownConfig.darkConfig,
      ),
    );
  }
}
