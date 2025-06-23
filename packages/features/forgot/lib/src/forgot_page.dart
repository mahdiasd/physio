import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import '../forgot.dart';
import 'bloc/forgot_effect.dart';
import 'bloc/forgot_event.dart';
import 'bloc/forgot_state.dart';

class ForgotPage extends StatelessWidget {
  final VoidCallback navigateBack;
  final VoidCallback navigateToVerify;

  const ForgotPage({
    super.key,
    required this.navigateBack,
    required this.navigateToVerify,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ForgotBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: navigateBack,
        NavigateToVerify: navigateToVerify,
      },
      child: ForgotContent(),
    );
  }
}

class ForgotContent extends StatelessWidget {
  const ForgotContent({super.key});

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
                child: ForgotForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotForm extends StatelessWidget {
  const ForgotForm({super.key});

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
              HeadlineLargeBoldText("Forgot"),
              if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                BodyMediumText(
                    textAlign: TextAlign.center,
                    "Log in to check your programmes, book appointments, and chat with your practitioner."),
            ],
          ),
          BlocBuilder<ForgotBloc, ForgotState>(
            builder: (context, state) {
              return Column(spacing: 16, children: [
                AppTextField(
                  value: state.email,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  hint: "Enter your email",
                  title: "Email",
                  onChanged: (text) {
                    context.read<ForgotBloc>().add(EmailChanged(text));
                  },
                ),
              ]);
            },
          ),
          Column(
            spacing: 12,
            children: [
              BlocBuilder<ForgotBloc, ForgotState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: AppPrimaryButton(
                      text: "Send Email",
                      onPressed: () {
                        context.read<ForgotBloc>().add(SendEmailClick());
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
