import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import 'bloc/register_bloc.dart';
import 'bloc/register_effect.dart';
import 'bloc/register_event.dart';
import 'bloc/register_state.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback navigateToVerify;
  final VoidCallback navigateBack;

  const RegisterPage({
    super.key,
    required this.navigateToVerify,
    required this.navigateBack,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: (_) => navigateBack(),
        NavigateToVerify: (_) => navigateToVerify(),
      },
      child: RegisterContent(),
    );
  }
}

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Row(
        children: [
          if (!ResponsiveBreakpoints.of(context).isMobile)
            Expanded(
              child: WebLeftSection(spacing: 60,),
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: AppConstant.webRightSectionMaxWidth, maxHeight: double.infinity),
                child: RegisterForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
        SizedBox(height: 60,),
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
          ResponsiveBreakpoints.of(context).isMobile ? "Sign Up" : "Create Your Client Account",
          textAlign: TextAlign.center,
          color: titleColor,
        ),
        if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
          HeadlineSmallText(
            textAlign: TextAlign.center,
            "Join Rose Physio HUB to access your personalised care plan, track progress, and stay connected with your practitioner.",
          ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, {required MainAxisAlignment columnMainAxisAlignment}) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: columnMainAxisAlignment,
            spacing: 28,
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: AppTextField(
                      value: state.firstName,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      title: "First Name",
                      hint: "First Name",
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(FirstNameChanged(text));
                      },
                    ),
                  ),
                  Expanded(
                    child: AppTextField(
                      value: state.lastName,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      title: "Last Name",
                      hint: "Last Name",
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(LastNameChanged(text));
                      },
                    ),
                  ),
                ],
              ),
              AppTextField(
                value: state.email,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                title: "Email Address",
                hint: "Enter your email",
                onChanged: (text) {
                  context.read<RegisterBloc>().add(EmailChanged(text));
                },
              ),
              Column(
                spacing: 8,
                children: [
                  AppTextField(
                    value: state.password,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: state.isPasswordObscured,
                    trailingIcon: IconButton(
                      icon: Icon(
                        state.isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () => context.read<RegisterBloc>().add(TogglePasswordVisibility()),
                    ),
                    title: "Password",
                    hint: "Enter your password",
                    label: "It must be a combination of minimum 8 letters, numbers, and symbols.",
                    onChanged: (text) {
                      context.read<RegisterBloc>().add(PasswordChanged(text));
                    },
                  ),
                ],
              ),
              const SizedBox(),
              PrivacyPolicyText(
                onPrivacyPolicyTap: () {},
                onTermsConditionsTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme, {required MainAxisAlignment columnMainAxisAlignment}) {
    return Column(
      mainAxisAlignment: columnMainAxisAlignment,
      spacing: 23,
      children: [
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) => previous.isLoading != current.isLoading,
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                text: "Continue",
                onPressed: () {
                  context.read<RegisterBloc>().add(RegisterPressed());
                },
                isLoading: state.isLoading,
              ),
            );
          },
        ),
        ButtonDownsideText(
          'Already have an account?',
          color: theme.colorScheme.secondary,
          onTap: () {
            context.read<RegisterBloc>().add(LoginPressed());
          },
        ),
      ],
    );
  }
}

class PrivacyPolicyText extends StatelessWidget {
  final VoidCallback? onPrivacyPolicyTap;
  final VoidCallback? onTermsConditionsTap;
  final Color? linkColor;
  final Color? textColor;

  const PrivacyPolicyText({
    super.key,
    this.onPrivacyPolicyTap,
    this.onTermsConditionsTap,
    this.linkColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultLinkColor = linkColor ?? theme.colorScheme.secondary;
    final defaultTextColor = textColor ?? theme.textTheme.bodyMedium?.color;

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        children: [
          BodyMediumText(
            'By continuing, you agree to our ',
            color: defaultTextColor,
          ),
          ButtonDownsideText(
            'Privacy Policy',
            color: defaultLinkColor,
            onTap: onPrivacyPolicyTap,
          ),
          BodyMediumText(
            ' and ',
            color: defaultTextColor,
          ),
          ButtonDownsideText(
            'Terms & Conditions',
            color: defaultLinkColor,
            onTap: onTermsConditionsTap,
          ),
          BodyMediumText(
            '.',
            color: defaultTextColor,
          ),
        ],
      ),
    );
  }
}
