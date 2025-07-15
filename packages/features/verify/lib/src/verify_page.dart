import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import 'bloc/verify_bloc.dart';
import 'bloc/verify_effect.dart';
import 'bloc/verify_event.dart';
import 'bloc/verify_state.dart';

class VerifyPage extends StatelessWidget {
  final VoidCallback navigateBack;
  final VoidCallback navigateToMain;

  const VerifyPage({
    super.key,
    required this.navigateBack,
    required this.navigateToMain,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VerifyBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: (_) => navigateBack(),
        NavigateToMain: (_) => navigateToMain(),
      },
      child: VerifyContent(),
    );
  }
}

class VerifyContent extends StatelessWidget {
  const VerifyContent({super.key});

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
                child: VerifyForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyForm extends StatefulWidget {
  const VerifyForm({super.key});

  @override
  State<VerifyForm> createState() => _VerifyFormState();
}

class _VerifyFormState extends State<VerifyForm> {
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
    context.read<VerifyBloc>().add(ResendCodeClicked());
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
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: isMobile ? _buildMobileLayout(context, theme) : _buildWebLayout(context, theme),
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return BlocBuilder<VerifyBloc, VerifyState>(
      builder: (context, state) {
        return Column(
          spacing: 0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 1, child: _buildHeader(context, state.isVerified, columnMainAxisAlignment: MainAxisAlignment.center)),
            Expanded(flex: 2, child: _buildFormFields(context, columnMainAxisAlignment: MainAxisAlignment.start)),
            Expanded(flex: 1, child: _buildActions(context, theme, columnMainAxisAlignment: MainAxisAlignment.center)),
          ],
        );
      },
    );
  }

  Widget _buildWebLayout(BuildContext context, ThemeData theme) {
    return BlocBuilder<VerifyBloc, VerifyState>(
      builder: (context, state) {
        return Column(
          spacing: 0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: _buildHeader(context, state.isVerified, columnMainAxisAlignment: MainAxisAlignment.end)),
            Expanded(flex: 2, child: _buildFormFields(context, columnMainAxisAlignment: MainAxisAlignment.center)),
            Expanded(flex: 1, child: _buildActions(context, theme, columnMainAxisAlignment: MainAxisAlignment.start)),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isVerified, {required MainAxisAlignment columnMainAxisAlignment}) {
    return Column(
      spacing: 24,
      mainAxisAlignment: columnMainAxisAlignment,
      children: [
        DisplayLargeText(
          isVerified ? "Email Verified" : "Verify Your Email",
          textAlign: TextAlign.center,
          color: Theme.of(context).colorScheme.primary,
        ),
        Column(
          spacing: 8,
          children: [
            HeadlineMediumText(
              textAlign: TextAlign.center,
              !isVerified ? "We've sent a 4-digit verification code to $email" : "Your email has been successfully verified.",
            ),
            HeadlineSmallText(
              textAlign: TextAlign.center,
              !isVerified ? "Please enter the code below to confirm your email address." : "You're all set to get started!",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, {required MainAxisAlignment columnMainAxisAlignment}) {
    if (isVerified) {
      return const SizedBox.shrink();
    }

    return Column(
      spacing: 24,
      children: [
        VerificationCodeInput(
          labelText: 'Enter Verification Code',
          onChange: (text) {
            context.read<VerifyBloc>().add(CodeChange(text));
          },
        ),
        _buildResendSection(context),
      ],
    );
  }

  Widget _buildResendSection(BuildContext context) {
    return BlocBuilder<VerifyBloc, VerifyState>(
      buildWhen: (previous, current) => previous.isResendLoading != current.isResendLoading,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            LabelMediumText("Didn't get the code?"),
            if (state.isResendLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else if (_secondsLeft > 0)
              LabelMediumText(
                "${_secondsLeft}s",
                color: Theme.of(context).colorScheme.secondary,
              )
            else
              BodyLargeText(
                "Resend Code",
                color: Theme.of(context).colorScheme.secondary,
                onTap: () => _onResendCode(context),
              ),
          ],
        );
      },
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme, {required MainAxisAlignment columnMainAxisAlignment}) {
    return Column(
      spacing: 12,
      children: [
        SizedBox(
          width: double.infinity,
          child: AppPrimaryButton(
            text: state.isVerified ? "Confirm" : "Continue",
            onPressed: () {
              if (state.isVerified)
                context.read<VerifyBloc>().add(VerifyClick());
              else
                context.read<VerifyBloc>().add(ContinueClick());
            },
            isLoading: state.isLoading,
          ),
        ),
      ],
    );
  }
}
