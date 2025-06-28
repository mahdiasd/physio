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
          if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
            Expanded(
              child: Container(
                height: double.infinity,
                color: Colors.grey,
                child: Column(spacing: 50, children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 16, right: 16),
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
                      "assets/images/login_vector.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ]),
              ),
            ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeader(context),
          BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
            buildWhen: (previous, current) =>
                previous.code != current.code ||
                previous.password != current.password ||
                previous.repeatPassword != current.repeatPassword ||
                previous.isRepeatPasswordObscured !=
                    current.isRepeatPasswordObscured ||
                previous.isPasswordObscured != current.isPasswordObscured,
            builder: (context, state) {
              return _buildCodeFields(context, state);
            },
          ),
          BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading ||
                previous.isResendLoading != current.isResendLoading,
            builder: (context, state) => _buildFooterSection(
              context,
              state,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      spacing: 16,
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

  Widget _buildCodeFields(BuildContext context, ResetPasswordState state) {
    return SingleChildScrollView(
      child: Column(
        spacing: 24,
        children: [
          VerificationCodeField(
            onChanged: (code) {
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
            value: state.repeatPassword,
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
              context.read<ResetPasswordBloc>().add(RepeatPasswordChanged(text));
            },
            label:
                "It must be a combination of minimum 8 letters, numbers, and symbols.",
          )
        ],
      ),
    );
  }

  Widget _buildFooterSection(
    BuildContext context,
    ResetPasswordState state,
  ) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            BodyMediumText("Didn't get the code?"),
            state.isResendLoading
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
            text: "Reset Password ",
            onPressed: () {
              context.read<ResetPasswordBloc>().add(ResetPasswordClick());
            },
            isLoading: state.isLoading,
          ),
        ),
      ],
    );
  }
}
