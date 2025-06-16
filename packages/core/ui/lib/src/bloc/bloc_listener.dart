
import 'package:flutter/material.dart';

import '../../ui.dart';

class BlocListenerWidget extends StatelessWidget {
  final Stream<dynamic> effectsStream;
  final Map<Type, VoidCallback> effectHandlers;
  final Stream<UiMessage> messageStream;
  final void Function(UiMessage)? customMessageHandler;
  final Widget child;

  const BlocListenerWidget({
    super.key,
    required this.effectsStream,
    required this.effectHandlers,
    required this.messageStream,
    this.customMessageHandler = null,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: effectsStream,
      builder: (context, effectSnapshot) {
        return StreamBuilder(
          stream: messageStream,
          builder: (context, messageSnapshot) {
            WidgetsBinding.instance.addPostFrameCallback((_) {

              if (effectSnapshot.hasData) {
                final effect = effectSnapshot.data;
                final handler = effectHandlers[effect.runtimeType];
                if (handler != null) {
                  handler();
                }
              }

              if (messageSnapshot.hasData) {
                final message = messageSnapshot.data!;
                if (customMessageHandler != null) {
                  customMessageHandler!(message);
                } else {
                  _showToast(context, message);
                }
              }
            });
            return child;
          },
        );
      },
    );
  }
}

void _showToast(BuildContext context, UiMessage message) {
  if (message.status == UiMessageStatus.Success) {
    successToast(
      title: 'Success',
      description: message.message,
    );
  } else if (message.status == UiMessageStatus.Error) {
    errorToast(
      title: 'Error',
      description: message.message,
    );
  } else if (message.status == UiMessageStatus.Warning) {
    // اگه بعداً warningToast اضافه کردی، اینجا استفاده کن
  }
}
