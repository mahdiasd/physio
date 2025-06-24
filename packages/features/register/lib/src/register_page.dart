import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/register_bloc.dart';
import 'bloc/register_effect.dart';
import 'bloc/register_event.dart';
import 'bloc/register_state.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback onMain;
  final VoidCallback onBack;

  const RegisterPage({
    super.key,
    required this.onMain,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: onBack,
        NavigateToMain: onMain,
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
              child: Container(
                color: Colors.grey,
                child: Column(spacing: 50, children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 24, right: 24),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 16,
              children: [
                HeadlineLargeBoldText("Sign Up"),
                if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                  BodyMediumText(
                      textAlign: TextAlign.center,
                      "Join Rose Physio HUB to access your personalised care plan, track progress, and stay connected with your practitioner."),
              ],
            ),
            SizedBox(height: 8),
            BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return Column(spacing: 8, children: [
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: AppTextField(
                          value: state.firstName,
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                          title: "First Name",
                          hint: "First Name",
                          onChanged: (text) {
                            context
                                .read<RegisterBloc>()
                                .add(FirstNameChanged(text));
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
                            context
                                .read<RegisterBloc>()
                                .add(LastNameChanged(text));
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  AppTextField(
                    value: state.email,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    title: "Email",
                    hint: "Enter your email",
                    onChanged: (text) {
                      context.read<RegisterBloc>().add(EmailChanged(text));
                    },
                  ),
                  SizedBox(height: 8),
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
                          .read<RegisterBloc>()
                          .add(TogglePasswordVisibility()),
                    ),
                    title: "Password",
                    hint: "Enter your password",
                    onChanged: (text) {
                      context.read<RegisterBloc>().add(PasswordChanged(text));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: LabelSmallText(
                        "It must be a combination of minimum 8 letters, numbers, and symbols."),
                  )
                ]);
              },
            ),
            SizedBox(height: 8),
            Column(
              spacing: 12,
              children: [
                BlocBuilder<RegisterBloc, RegisterState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: AppPrimaryButton(
                        text: "Register",
                        onPressed: () {
                          context.read<RegisterBloc>().add(RegisterPressed());
                        },
                        isLoading: state.isLoading,
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    LabelMediumText(
                      'Already have an account?',
                    ),
                    BodyMediumBoldText(
                      'Log In',
                      color: theme.colorScheme.primary,
                      onTap: () {
                        context.read<RegisterBloc>().add(LoginPressed());
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
