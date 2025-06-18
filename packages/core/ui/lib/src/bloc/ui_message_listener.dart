import 'package:flutter/material.dart';

import '../../ui.dart';

class UiMessageListener extends StatelessWidget {
  final Stream<UiMessage> messageStream;
  final Widget child;

  const UiMessageListener({
    super.key,
    required this.messageStream,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, asyncSnapshot) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (asyncSnapshot.hasData) {
            final message = asyncSnapshot.data;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message.toString())),
            );
          }
        });
        return child;
      },
    );
  }
}