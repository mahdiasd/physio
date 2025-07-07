import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import '../login.dart';
import 'bloc/login_effect.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback navigateToMain;
  final VoidCallback navigateBack;
  final VoidCallback navigateToRegister;
  final VoidCallback navigateToForgotPassword;
  final VoidCallback navigateToVerify;
  final VoidCallback navigateToResetPassword;

  const LoginPage({
    super.key,
    required this.navigateToMain,
    required this.navigateBack,
    required this.navigateToRegister,
    required this.navigateToForgotPassword,
    required this.navigateToVerify,
    required this.navigateToResetPassword,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isShowResetPassDialog) {
          showAdaptiveDialog<void>(
            context: context,
            builder: (context) {
              return AppDialog(
                title: "Reset Password",
                description: "It seems like it's your first login. Please reset your password.",
                buttonText: "Reset Password",
                onButtonPressed: () {
                  context.read<LoginBloc>().add(ResetPasswordPressed());
                },
              );
            },
          );
        }
      },
      child: BlocListenerWidget(
        effectsStream: bloc.effectsStream,
        messageStream: bloc.messageStream,
        effectHandlers: {
          NavigateBack: navigateBack,
          NavigateToMain: navigateToMain,
          NavigateToResetPassword: navigateToResetPassword,
          NavigateToRegister: navigateToRegister,
          NavigateToForgotPassword: navigateToForgotPassword,
          NavigateToVerify: navigateToVerify,
        },
        child: LoginContent(),
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Row(
        children: [
          if (!ResponsiveBreakpoints.of(context).isMobile)
            Expanded(
              child: WebLeftSection(),
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500, maxHeight: double.infinity),
                child: AdaptiveFormLayout(
                  child: LoginForm(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: isMobile ? _buildMobileLayout(context, theme) : _buildWebLayout(context, theme),
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return OverflowDetectingColumn(
      spacing: 100,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // This will work when content fits
      children: [
        _buildHeader(context),
        _buildFormFields(context),
        _buildActions(context, theme),
      ],
    );
  }

  Widget _buildWebLayout(BuildContext context, ThemeData theme) {
    return OverflowDetectingColumn(
      spacing: 120,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildHeader(context),
        _buildFormFields(context),
        _buildActions(context, theme),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        DisplayLargeText("Login", color: Theme.of(context).colorScheme.primary),
        if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
          HeadlineSmallText(
            textAlign: TextAlign.center,
            "Login to check your programmes, book appointments, and chat with your practitioner.",
          ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 24,
            children: [
              AppTextField(
                value: state.email,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                hint: "Enter your email",
                title: "Email Address",
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
                hint: "Enter your password",
                title: "Password",
                onChanged: (text) {
                  context.read<LoginBloc>().add(PasswordChanged(text));
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: BodyMediumText(
                  "Forgot Password?",
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    context.read<LoginBloc>().add(ForgotPasswordPressed());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 12,
        children: [
          BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) => previous.isLoading != current.isLoading,
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: AppPrimaryButton(
                  text: "Login",
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
              LabelMediumText('No Account Yet?'),
              BodyLargeText(
                'Sign Up',
                color: theme.colorScheme.secondary,
                onTap: () {
                  context.read<LoginBloc>().add(RegisterPressed());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
