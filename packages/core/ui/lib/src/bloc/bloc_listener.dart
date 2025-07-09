import 'dart:async';

import 'package:flutter/material.dart';

import '../../ui.dart';

import 'dart:async';

import 'package:flutter/material.dart';

import '../../ui.dart';

class BlocListenerWidget extends StatefulWidget {
  final Stream<dynamic> effectsStream;
  final Map<Type, void Function(dynamic)> effectHandlers;
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
  State<BlocListenerWidget> createState() => _BlocListenerWidgetState();
}

class _BlocListenerWidgetState extends State<BlocListenerWidget> {
  StreamSubscription<dynamic>? _effectSubscription;
  StreamSubscription<UiMessage>? _messageSubscription;

  @override
  void initState() {
    super.initState();
    _setupListeners();
  }

  void _setupListeners() {
    _effectSubscription = widget.effectsStream.listen((effect) {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            final handler = widget.effectHandlers[effect.runtimeType];
            // تغییر در اینجا: effect رو به عنوان پارامتر پاس می‌کنیم
            handler?.call(effect);
          }
        });
      }
    });

    _messageSubscription = widget.messageStream.listen((message) {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            if (widget.customMessageHandler != null) {
              widget.customMessageHandler!(message);
            } else {
              _showToast(context, message);
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _effectSubscription?.cancel();
    _messageSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
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
    }
  }
}