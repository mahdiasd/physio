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
  final VoidCallback navigateToResetPassword;

  const ForgotPage({
    super.key,
    required this.navigateBack,
    required this.navigateToResetPassword,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ForgotBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: (_) => navigateBack(),
        NavigateToResetPassword: (_) => navigateToResetPassword(),
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
              child: WebLeftSection(),
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500, maxHeight: double.infinity),
                child: AdaptiveFormLayout(
                  child: ForgotForm(),
                ),
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
      children: [
        Expanded(child: _buildHeader(context)),
        Expanded(child: _buildFormFields(context)),
        Expanded(child: _buildActions(context, theme)),
      ],
    );
  }

  Widget _buildWebLayout(BuildContext context, ThemeData theme) {
    return OverflowDetectingColumn(
      spacing: 120,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _buildHeader(context)),
        Expanded(child: _buildFormFields(context)),
        Expanded(child: _buildActions(context, theme)),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DisplayLargeText(
          "Forgotten Your Password?",
          textAlign: TextAlign.center,
          color: Theme.of(context).colorScheme.primary,
        ),
        BodyMediumText(
          textAlign: TextAlign.center,
          "We'll send a verification code to your email so you can reset your password.",
        ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return BlocBuilder<ForgotBloc, ForgotState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 24,
          children: [
            AppTextField(
              value: state.email,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              hint: "Enter your email",
              title: "Email Address",
              onChanged: (text) {
                context.read<ForgotBloc>().add(EmailChanged(text));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<ForgotBloc, ForgotState>(
          buildWhen: (previous, current) => previous.isLoading != current.isLoading,
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                text: "Continue",
                onPressed: () {
                  context.read<ForgotBloc>().add(SendEmailClick());
                },
                isLoading: state.isLoading,
              ),
            );
          },
        ),
      ],
    );
  }
}
