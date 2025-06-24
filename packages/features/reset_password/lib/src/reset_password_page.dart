import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/reset_password_bloc.dart';
import 'bloc/reset_password_effect.dart';
import 'bloc/reset_password_event.dart';

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
      child: ResetPasswordContent(),
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
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Column(spacing: 50, children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100, left: 24, right: 24),
                    child: Column(
                      spacing: 16,
                      children: [
                        HeadlineLargeBoldText("Rose Physio HUB",
                            textAlign: TextAlign.center,
                            color: theme.colorScheme.onPrimary),
                        BodyMediumText(
                            "Your personal space to follow your care plan, track your progress, and stay connected with your practitioner.",
                            textAlign: TextAlign.center,
                            color: theme.colorScheme.onPrimary),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      "assets/images/login_vector.jpg",
                      fit: BoxFit.cover,
                    ),
                  )
                ]),
              ),
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 400,
                ),
                child: ResetPasswordForm(),
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
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

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

  void _onCodeChanged(BuildContext context, int index, String value) {
    final bloc = context.read<ResetPasswordBloc>();
    bloc.add(CodeDigitChanged(index, value));

    if (RegExp(r'^\d$').hasMatch(value) && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _onResendCode(BuildContext context) {
    _startCountdown();
    context.read<ResetPasswordBloc>().add(ResendCodeClicked());
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVerified =
        context.select((ResetPasswordBloc bloc) => bloc.state.isVerified);
    final isLoading =
        context.select((ResetPasswordBloc bloc) => bloc.state.isLoading);
    final isResendLoading =
        context.select((ResetPasswordBloc bloc) => bloc.state.isResendLoading);
    final codes = context.select((ResetPasswordBloc bloc) => bloc.state.codes);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeader(context, isVerified),
          if (!isVerified) _buildCodeFields(context, codes),
          _buildFooterSection(context, isVerified, isLoading, isResendLoading),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isVerified) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadlineLargeBoldText(
          "Reset Password",
          color: Theme.of(context).colorScheme.primary,
          textAlign: TextAlign.center,
        ),
        BodySmallText(
          textAlign: TextAlign.center,
          "Check your email and enter the code to reset your password.",
        ),
      ],
    );
  }

  Widget _buildCodeFields(BuildContext context, List<String> codes) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 50,
              child: AppTextField(
                value: codes[index],
                maxLines: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) => _onCodeChanged(context, index, value),
                textDirection: TextDirection.ltr,
                obscureText: false,
                showClearIcon: false,
                readOnly: false,
                enabled: true,
                focusNode: _focusNodes[index],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildFooterSection(
    BuildContext context,
    bool isVerified,
    bool isLoading,
    bool isResendLoading,
  ) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            BodyMediumText("Didn't get the code?"),
            isResendLoading
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : BodyMediumBoldText(
                    "Resend Code",
                    color: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      _onResendCode(context);
                    },
                  )
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: AppPrimaryButton(
            text: isVerified ? "Confirm" : "Continue",
            onPressed: () {
              context.read<ResetPasswordBloc>().add(ResetPasswordClick());
            },
            isLoading: isLoading,
          ),
        ),
      ],
    );
  }
}
