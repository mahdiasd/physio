import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/src/bloc/splash_event.dart';
import 'package:splash/src/bloc/splash_state.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import 'bloc/splash_bloc.dart';
import 'bloc/splash_effect.dart';

class SplashPage extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onMain;

  const SplashPage({
    super.key,
    required this.onLogin,
    required this.onMain,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<SplashBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: Builder(builder: (context) {
        return BlocListenerWidget(
          effectsStream: bloc.effectsStream,
          messageStream: bloc.messageStream,
          effectHandlers: {
            NavigateToLogin: (_) => onLogin(),
            NavigateToMain: (_) => onMain(),
          },
          child: SplashContent(),
        );
      }),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.updateState != null && state.updateState != UpdateState.upToDate) {
          _showUpdateDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ic_logo.png', width: 100, height: 100),
              const SizedBox(height: 20),
              BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              return Text(
                state.isLoading ? 'Loading...' : 'Ready',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context) {
    final bloc = context.read<SplashBloc>();

    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (modalContext) {
        return UpdateDialog(
          onUpdatePressed: () {
            bloc.add(OnUpdateClick());
          },
        );
      },
    );
  }
}

class UpdateDialog extends StatelessWidget {
  final VoidCallback onUpdatePressed;

  const UpdateDialog({
    super.key,
    required this.onUpdatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.system_update, size: 48, color: Colors.blue),
          const SizedBox(height: 16),
          Text(
            'Update Required',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          const Text(
            'A new version of the app is available. Please update to continue.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onUpdatePressed,
              child: const Text('Update Now'),
            ),
          ),
        ],
      ),
    );
  }
}
