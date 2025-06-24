import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

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

class VerifyForm extends StatelessWidget {
  const VerifyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 16,
            children: [
              HeadlineLargeBoldText("Verify Your Email"),
              if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                BodyMediumText(
                    textAlign: TextAlign.center,
                    "We've sent a 4-digit verification code to [client email]."),
              BodyMediumText(
                  textAlign: TextAlign.center,
                  "Please enter the code below to confirm your email address."),
            ],
          ),

          VerifyCodeFields(),

          Column(
            spacing: 12,
            children: [
              BlocBuilder<VerifyBloc, VerifyState>(
                buildWhen: (previous, current) =>
                    (previous.isLoading != current.isLoading) ||
                    (previous.isVerified != current.isVerified),
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: AppPrimaryButton(
                      text: state.isVerified ? "Confirm" : "Continue",
                      onPressed: () {
                        context.read<VerifyBloc>().add(VerifyClick());
                      },
                      isLoading: state.isLoading,
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}


class VerifyCodeFields extends StatefulWidget {
  const VerifyCodeFields({super.key});

  @override
  State<VerifyCodeFields> createState() => _VerifyCodeFieldsState();
}

class _VerifyCodeFieldsState extends State<VerifyCodeFields> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
    _focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleInput(BuildContext context, int index, String value) {
    final bloc = context.read<VerifyBloc>();

    // فقط اولین کاراکتر رو بپذیر
    if (value.length > 1) {
      value = value.substring(value.length - 1);
    }

    _controllers[index].text = value;
    _controllers[index].selection = TextSelection.collapsed(offset: value.length);
    bloc.add(CodeDigitChanged(index, value));

    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyBloc, VerifyState>(
      builder: (context, state) {
        // مقدارهای ورودی رو همواره با استیت سینک کن
        for (int i = 0; i < 4; i++) {
          if (_controllers[i].text != state.codeDigits[i]) {
            _controllers[i].text = state.codeDigits[i];
            _controllers[i].selection = TextSelection.collapsed(offset: state.codeDigits[i].length);
          }
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 60,
              child: AppTextField(
                value: _controllers[index].text,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLines: 1,
                title: index == 0 ? "Enter code" : null,
                onChanged: (text) => _handleInput(context, index, text),
              ),
            );
          }),
        );
      },
    );
  }
}
