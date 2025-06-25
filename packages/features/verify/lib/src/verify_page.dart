import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/verify_bloc.dart';
import 'bloc/verify_effect.dart';
import 'bloc/verify_event.dart';

class VerifyPage extends StatelessWidget {
  final VoidCallback navigateBack;
  final VoidCallback navigateToMain;

  const VerifyPage({
    super.key,
    required String email,
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
        NavigateBack: navigateBack,
        NavigateToMain: navigateToMain,
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
    final isVerified =
        context.select((VerifyBloc bloc) => bloc.state.isVerified);
    final isLoading = context.select((VerifyBloc bloc) => bloc.state.isLoading);
    final isResendLoading =
        context.select((VerifyBloc bloc) => bloc.state.isResendLoading);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeader(context, isVerified),
          if (!isVerified)
            VerificationCodeField(
              labelText: 'Enter Verification Code',
              onChanged: (text) {
                context.read<VerifyBloc>().add(CodeChange(text));
              },
            ),
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
          isVerified ? "Email Verified" : "Verify Your Email",
          textAlign: TextAlign.center,
        ),
        BodySmallText(
          textAlign: TextAlign.center,
          !isVerified
              ? "We've sent a 4-digit verification code to [client email]."
              : "Your email has been successfully verified.",
        ),
        BodySmallText(
          textAlign: TextAlign.center,
          !isVerified
              ? "Please enter the code below to confirm your email address."
              : "You're all set to get started!",
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
              context.read<VerifyBloc>().add(VerifyClick());
            },
            isLoading: isLoading,
          ),
        ),
      ],
    );
  }
}
