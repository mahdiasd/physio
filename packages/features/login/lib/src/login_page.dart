import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utils/utils.dart';

import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onMain;
  const LoginPage({super.key, required this.onMain});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return EffectListener(
      effectsStream: bloc.effectsStream,
      onLogin: onLogin,
      onMain: onMain,
      child: LoginContent(),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Your login form widgets will go here
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}


class EffectListener extends StatelessWidget {
  final Stream<dynamic> effectsStream;
  final VoidCallback onMain;
  final Widget child;

  const EffectListener({
    super.key,
    required this.effectsStream,
    required this.onMain,
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

          }
        });
        return child;
      },
    );
  }
}
