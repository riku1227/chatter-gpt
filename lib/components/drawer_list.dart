import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerList extends ConsumerWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(children: [
      ListTile(
          title: const Text('test'),
          onTap: () {
            print("test");
          })
    ]);
  }
}
