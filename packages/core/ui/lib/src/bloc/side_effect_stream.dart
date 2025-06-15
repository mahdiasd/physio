import 'dart:async';

import 'package:bloc/bloc.dart';

import '../model/ui_message/ui_message.dart';

mixin SideEffectMixin<S, E> on BlocBase<S> {
  final _effectController = StreamController<E>.broadcast();
  final _messageController = StreamController<UiMessage>.broadcast();

  Stream<E> get effectsStream => _effectController.stream;
  Stream<UiMessage> get messageStream => _messageController.stream;

  void emitEffect(E effect) => _effectController.add(effect);
  void emitMessage(UiMessage message) => _messageController.add(message);

  @override
  Future<void> close() async {
    await _effectController.close();
    await _messageController.close();
    await super.close();
  }
}

