import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/reset_password_bloc.dart';
import 'bloc/reset_password_effect.dart';
import 'bloc/reset_password_event.dart';
import 'bloc/reset_password_state.dart';

class ResetPasswordPage extends StatelessWidget {
  final VoidCallback navigateBack;
  final VoidCallback navigateToMain;

  const ResetPasswordPage({
    super.key,
    required this.navigateBack,
    required this.navigateToMain,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResetPasswordBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: navigateBack,
        NavigateToMain: navigateToMain,
      },
      child: const ResetPasswordContent(),
    );
  }
}

class ResetPasswordContent extends StatelessWidget {
  const ResetPasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Row(
        children: [
          if (!ResponsiveBreakpoints.of(context).isMobile)
            const Expanded(
              child: WebLeftSection(),
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    maxWidth: 500, maxHeight: double.infinity),
                child: const AdaptiveFormLayout(
                  child: ResetPasswordForm(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  Timer? _timer;
  int _secondsLeft = 60;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _secondsLeft = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _onResendCode(BuildContext context) {
    _startCountdown();
    context.read<ResetPasswordBloc>().add(ResendCodeClicked());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: OverflowDetectingColumn(
        spacing: isMobile ? 80 : 80,
        mainAxisAlignment: isMobile
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          _buildHeader(context),
          _buildFormFields(context),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        DisplayLargeText(
          "Reset Password",
          color: Theme.of(context).colorScheme.primary,
          textAlign: TextAlign.center,
        ),
        if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
          HeadlineSmallText(
            "Check your email and enter the code to reset your password.",
            textAlign: TextAlign.center,
          ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Column(
          spacing: 24,
          children: [
            VerificationCodeInput(
              onChange: (code) {
                context.read<ResetPasswordBloc>().add(CodeChanged(code));
              },
              labelText: "Enter Code",
            ),
            AppTextField(
              value: state.password,
              keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: state.isPasswordObscured,
              trailingIcon: IconButton(
                icon: Icon(
                  state.isPasswordObscured
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () => context
                    .read<ResetPasswordBloc>()
                    .add(TogglePasswordVisibility()),
              ),
              hint: "Enter your new password",
              title: "New Password",
              onChanged: (text) {
                context.read<ResetPasswordBloc>().add(PasswordChanged(text));
              },
              label:
              "It must be a combination of minimum 8 letters, numbers, and symbols.",
            ),
            AppTextField(
              value: state.confirmPassword,
              keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: state.isRepeatPasswordObscured,
              trailingIcon: IconButton(
                icon: Icon(
                  state.isRepeatPasswordObscured
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () => context
                    .read<ResetPasswordBloc>()
                    .add(ToggleRepeatPasswordVisibility()),
              ),
              hint: "Enter your password again",
              title: "Rewrite New Password",
              onChanged: (text) {
                context
                    .read<ResetPasswordBloc>()
                    .add(RepeatPasswordChanged(text));
              },
              label:
              "It must be a combination of minimum 8 letters, numbers, and symbols.",
            ),
          ],
        );
      },
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
      previous.isLoading != current.isLoading ||
          previous.isResendLoading != current.isResendLoading,
      builder: (context, state) {
        return Column(
          spacing: 12,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                const LabelMediumText("Didn't get the code?"),
                state.isResendLoading
                    ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : BodyLargeText(
                  "Resend Code",
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () => _onResendCode(context),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                text: "Reset Password",
                onPressed: () {
                  context.read<ResetPasswordBloc>().add(ResetPasswordClick());
                },
                isLoading: state.isLoading,
              ),
            ),
          ],
        );
      },
    );
  }
}