import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

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
                constraints: BoxConstraints(maxWidth: AppConstant.webRightSectionMaxWidth, maxHeight: double.infinity),
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
        SizedBox(height: 60),
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
      spacing: 24,
      mainAxisAlignment: columnMainAxisAlignment,
      children: [
        DisplayLargeText(
          "Forgotten Your Password?",
          textAlign: TextAlign.center,
          color: titleColor,
        ),
        BodyMediumText(
          textAlign: TextAlign.center,
          "We'll send a verification code to your email so you\ncan reset your password.",
        ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, {required MainAxisAlignment columnMainAxisAlignment}) {
    return BlocBuilder<ForgotBloc, ForgotState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: columnMainAxisAlignment,
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

  Widget _buildActions(BuildContext context, ThemeData theme, {required MainAxisAlignment columnMainAxisAlignment}) {
    return Column(
      spacing: 35,
      mainAxisAlignment: columnMainAxisAlignment,
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

        /**
         * Fake text for align button from another pages.*/
        ButtonDownsideText(
          '',
          color: theme.colorScheme.secondary,
          onTap: () {},
        )
      ],
    );
  }
}
