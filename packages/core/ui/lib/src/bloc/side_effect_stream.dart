import 'dart:async';

import 'package:bloc/bloc.dart';

mixin SideEffectMixin<S, E> on BlocBase<S> {
  final _effectController = StreamController<E>.broadcast();

  Stream<E> get effectsStream => _effectController.stream;

  void emitEffect(E effect) => _effectController.add(effect);

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}
