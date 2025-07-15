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
          NavigateBack: (_) => navigateBack(),
          NavigateToMain: (_) => navigateToMain(),
          NavigateToResetPassword: (_) => navigateToResetPassword(),
          NavigateToRegister: (_) => navigateToRegister(),
          NavigateToForgotPassword: (_) => navigateToForgotPassword(),
          NavigateToVerify: (_) => navigateToVerify(),
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
                constraints: BoxConstraints(maxWidth: AppConstant.webRightSectionMaxWidth, maxHeight: double.infinity),
                child: LoginForm(),
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
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: isMobile ? _buildMobileLayout(context, theme) : _buildWebLayout(context, theme),
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return Column(
      spacing: 0,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: _buildHeader(context, columnMainAxisAlignment: MainAxisAlignment.center)),
        Expanded(flex: 2, child: _buildFormFields(context, columnMainAxisAlignment: MainAxisAlignment.start)),
        Expanded(flex: 1, child: _buildActions(context, theme, columnMainAxisAlignment: MainAxisAlignment.center)),
      ],
    );
  }

  Widget _buildWebLayout(BuildContext context, ThemeData theme) {
    return Column(
      spacing: 0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: _buildHeader(context, columnMainAxisAlignment: MainAxisAlignment.end)),
        Expanded(flex: 2, child: _buildFormFields(context, columnMainAxisAlignment: MainAxisAlignment.center)),
        Expanded(flex: 1, child: _buildActions(context, theme, columnMainAxisAlignment: MainAxisAlignment.start)),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, {required MainAxisAlignment columnMainAxisAlignment}) {
    final titleColor =
        ResponsiveBreakpoints.of(context).largerThan(MOBILE) ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface;
    return Column(
      mainAxisAlignment: columnMainAxisAlignment,
      spacing: 24,
      children: [
        DisplayLargeText("Login", color: titleColor),
        if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
          HeadlineSmallText(
            textAlign: TextAlign.center,
            "Login to check your programmes, book appointments, and chat with your practitioner.",
          ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, {required MainAxisAlignment columnMainAxisAlignment}) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: columnMainAxisAlignment,
          spacing: 10,
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
            const SizedBox(height: 10),
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
              child: ButtonDownsideText(
                "Forgot Password?",
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  context.read<LoginBloc>().add(ForgotPasswordPressed());
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme, {required MainAxisAlignment columnMainAxisAlignment}) {
    return Column(
      spacing: 35,
      mainAxisAlignment: columnMainAxisAlignment,
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
            BodyMediumText('No Account Yet?'),
            ButtonDownsideText(
              'Sign Up',
              color: theme.colorScheme.secondary,
              onTap: () {
                context.read<LoginBloc>().add(RegisterPressed());
              },
            ),
          ],
        ),
      ],
    );
  }
}
