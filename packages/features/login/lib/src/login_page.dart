import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../login.dart';
import 'bloc/login_effect.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onMain;
  final VoidCallback onBack;

  const LoginPage({
    super.key,
    required this.onMain,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: onBack,
        NavigateToMain: onMain,
      },
      child: LoginContent(),
    );
  }
}

// Login Content
class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadlineLargeBoldText("Login"),
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) => previous.email != current.email,
              builder: (context, state) {
                return Column(spacing: 16, children: [
                  AppTextField(
                    value: state.email,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    hint: "Email",
                    onChanged: (text) {
                      context.read<LoginBloc>().add(EmailChanged(text));
                    },
                  ),
                  AppTextField(
                    value: state.password,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: state.isPasswordObscured,
                    trailingIcon: IconButton(
                      icon: Icon(
                        state.isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () => context.read<LoginBloc>().add(TogglePasswordVisibility()),
                    ),
                    hint: "Password",
                    onChanged: (text) {
                      context.read<LoginBloc>().add(PasswordChanged(text));
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: BodyMediumText(
                      "Forgot Password?",
                      color: theme.colorScheme.primary,
                      onTap: () {
                        context.read<LoginBloc>().add(ForgotPasswordPressed());
                      },
                    ),
                  ),
                ]);
              },
            ),
            Column(
              spacing: 12,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: AppPrimaryButton(
                        text: "Log In",
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginPressed());
                        },
                        isLoading: state.isLoading,
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    LabelMediumText(
                      'No Account Yet?',
                    ),
                    BodyMediumBoldText(
                      'Sign Up',
                      color: theme.colorScheme.primary,
                      onTap: () {
                        context.read<LoginBloc>().add(SignUpPressed());
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
