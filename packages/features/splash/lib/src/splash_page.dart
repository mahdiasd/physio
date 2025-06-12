import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart'; // فرض می‌کنیم UiMessage و SideEffectMixin اینجا هستن

import 'bloc/splash_bloc.dart';
import 'bloc/splash_effect.dart';
import 'bloc/splash_event.dart';
import 'bloc/splash_state.dart';

// ویجت برای مدیریت افکت‌ها و پیام‌ها
class SideEffectHandler extends StatelessWidget {
  final Stream<dynamic> effectsStream;
  final Stream<UiMessage> messageStream;
  final VoidCallback onLogin;
  final VoidCallback onMain;
  final Widget child;

  const SideEffectHandler({
    Key? key,
    required this.effectsStream,
    required this.messageStream,
    required this.onLogin,
    required this.onMain,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: effectsStream,
      builder: (context, effectSnapshot) {
        if (effectSnapshot.hasData) {
          final effect = effectSnapshot.data;
          if (effect is NavigateToLogin) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              onLogin();
            });
          } else if (effect is NavigateToMain) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              "ToMain".dLog();
              onMain();
            });
          }
        }
        return StreamBuilder<UiMessage>(
          stream: messageStream,
          builder: (context, messageSnapshot) {
            if (messageSnapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ToastWidget.showToast(messageSnapshot.data!);
              });
            }
            return child;
          },
        );
      },
    );
  }
}

// ویجت استاتیک برای نمایش Toast
class ToastWidget {
  static void showToast(UiMessage message) {
    Fluttertoast.showToast(
      msg: message.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: _getBackgroundColor(message.status),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Color _getBackgroundColor(UiMessageStatus status) {
    switch (status) {
      case UiMessageStatus.Success:
        return Colors.green;
      case UiMessageStatus.Error:
        return Colors.red;
      case UiMessageStatus.Warning:
        return Colors.orange;
    }
  }
}

// SplashPage اصلاح‌شده
class SplashPage extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onMain;

  const SplashPage({
    Key? key,
    required this.onLogin,
    required this.onMain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(), // فرض می‌کنیم SplashBloc تعریف شده
      child: Builder(
        builder: (context) {
          final bloc = context.read<SplashBloc>();
          return SideEffectHandler(
            effectsStream: bloc.effectsStream,
            messageStream: bloc.messageStream,
            onLogin: onLogin,
            onMain: onMain,
            child: SplashContent(),
          );
        },
      ),
    );
  }
}

// SplashContent بدون تغییر
class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.updateState != null &&
            state.updateState != UpdateState.upToDate) {
          _showUpdateDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ic_logo.png',
                  width: 100, height: 100),
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

// ویجت دیالوگ آپدیت
class UpdateDialog extends StatelessWidget {
  final VoidCallback onUpdatePressed;

  const UpdateDialog({
    Key? key,
    required this.onUpdatePressed,
  }) : super(key: key);

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