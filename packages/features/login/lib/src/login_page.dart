import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../login.dart';
import 'bloc/login_effect.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onMain;

  const LoginPage({
    super.key,
    required this.onMain,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return EffectListener(
      effectsStream: bloc.effectsStream,
      onMain: onMain,
      child: const LoginContent(),
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
      builder: (context, snapshot) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final effect = snapshot.data;
          if (effect is NavigateToHome) {
            onMain();
          }
        });
        return child;
      },
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state.isLoading,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    value: state.username,
                    onChanged: (value) => bloc.add(UsernameChanged(value)),
                    hint: 'Username',
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    value: state.password,
                    onChanged: (value) => bloc.add(PasswordChanged(value)),
                    hint: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => bloc.add(const LoginSubmitted()),
                      child: state.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
