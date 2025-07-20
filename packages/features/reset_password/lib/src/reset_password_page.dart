import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

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
        NavigateBack: (_) => navigateBack(),
        NavigateToMain: (_) => navigateToMain(),
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
            child: MaxWidthBox(
              maxWidth: AppConstant.webRightSectionMaxWidth,
              child: ResetPasswordForm(),
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
        Expanded(flex: 1, child: _buildHeader(context, columnMainAxisAlignment: MainAxisAlignment.end)),
        Expanded(flex: 2, child: _buildFormFields(context, columnMainAxisAlignment: MainAxisAlignment.center)),
        Expanded(flex: 1, child: _buildActions(context, theme, columnMainAxisAlignment: MainAxisAlignment.start)),
      ],
    );
  }

  Widget _buildWebLayout(BuildContext context, ThemeData theme) {
    return Column(
      spacing: 0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: _buildHeader(context, columnMainAxisAlignment: MainAxisAlignment.end)),
        SizedBox(
          height: 60,
        ),
        Expanded(
            flex: 2,
            child: MaxWidthBox(
                maxWidth: AppConstant.webRightSectionChildWidth,
                child: _buildFormFields(context, columnMainAxisAlignment: MainAxisAlignment.center))),
        Expanded(
            flex: 1,
            child: MaxWidthBox(
                maxWidth: AppConstant.webRightSectionChildWidth,
                child: _buildActions(context, theme, columnMainAxisAlignment: MainAxisAlignment.start))),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, {required MainAxisAlignment columnMainAxisAlignment}) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final titleColor = !isMobile ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface;
    return Column(
      spacing: isMobile ? 50 : 24,
      mainAxisAlignment: columnMainAxisAlignment,
      children: [
        PageHeaderText(
          "Reset Password",
          color: titleColor,
          textAlign: TextAlign.center,
        ),
        if (!isMobile)
          PageSubTitleText(
            "Check your email and enter the code to reset your password.",
            textAlign: TextAlign.center,
          )
        else
          BodyText(
            "Check your email and enter the code to reset your\npassword.",
            textAlign: TextAlign.center,
          )
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, {required MainAxisAlignment columnMainAxisAlignment}) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: columnMainAxisAlignment,
          spacing: 24,
          children: [
            VerificationCodeInput(
              onChange: (code) {
                context.read<ResetPasswordBloc>().add(CodeChanged(code));
              },
              title: "Enter Code",
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
                onPressed: () => context.read<ResetPasswordBloc>().add(TogglePasswordVisibility()),
              ),
              hint: "Enter your new password",
              title: "New Password",
              onChanged: (text) {
                context.read<ResetPasswordBloc>().add(PasswordChanged(text));
              },
              label: "It must be a combination of minimum 8 letters, numbers, and symbols.",
            ),
            AppTextField(
              value: state.confirmPassword,
              keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: state.isRepeatPasswordObscured,
              trailingIcon: IconButton(
                icon: Icon(
                  state.isRepeatPasswordObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => context.read<ResetPasswordBloc>().add(ToggleRepeatPasswordVisibility()),
              ),
              hint: "Enter your password again",
              title: "Rewrite New Password",
              onChanged: (text) {
                context.read<ResetPasswordBloc>().add(RepeatPasswordChanged(text));
              },
              label: "It must be a combination of minimum 8 letters, numbers, and symbols.",
            ),
          ],
        );
      },
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme, {required MainAxisAlignment columnMainAxisAlignment}) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading || previous.isResendLoading != current.isResendLoading,
      builder: (context, state) {
        final canResend = _secondsLeft == 0 && !state.isResendLoading;
        return Column(
          mainAxisAlignment: columnMainAxisAlignment,
          spacing: 25,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                const BottomNavigationText("Didn't get the code?"),
                state.isResendLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : canResend
                        ? BodyLargeText(
                            "Resend Code",
                            color: Theme.of(context).colorScheme.secondary,
                            onTap: () => _onResendCode(context),
                          )
                        : BodyLargeText(
                            "Resend in $_secondsLeft s",
                            color: Theme.of(context).colorScheme.secondary,
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
