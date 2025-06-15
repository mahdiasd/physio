
import 'package:flutter/material.dart';

class EffectListener extends StatelessWidget {
  final Stream<dynamic> effectsStream;
  final Map<Type, VoidCallback> effectHandlers;
  final Widget child;

  const EffectListener({
    super.key,
    required this.effectsStream,
    required this.effectHandlers,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: effectsStream,
      builder: (context, asyncSnapshot) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (asyncSnapshot.hasData) {
            final effect = asyncSnapshot.data;
            final handler = effectHandlers[effect.runtimeType];
            if (handler != null) {
              handler();
            }
          }
        });
        return child;
      },
    );
  }
}
