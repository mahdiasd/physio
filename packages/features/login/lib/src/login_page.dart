import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import '../login.dart';
import 'bloc/login_effect.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback navigateToMain;
  final VoidCallback navigateBack;
  final VoidCallback navigateToRegister;
  final VoidCallback navigateToForgotPassword;

  const LoginPage({
    super.key,
    required this.navigateToMain,
    required this.navigateBack,
    required this.navigateToRegister,
    required this.navigateToForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: navigateBack,
        NavigateToMain: navigateToMain,
        NavigateToRegister: navigateToRegister,
        NavigateToForgotPassword: navigateToForgotPassword,
      },
      child: LoginContent(),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

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
                      "assets/images/login_vector.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ]),
              ),
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: 500, maxHeight: double.infinity),
                child: LoginForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
              HeadlineLargeBoldText("Login"),
              if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                BodyMediumText(
                    textAlign: TextAlign.center,
                    "Login to check your programmes, book appointments, and chat with your practitioner."),
            ],
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Column(spacing: 16, children: [
                AppTextField(
                  value: state.email,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  hint: "Enter your email",
                  title: "Email Address",
                  onChanged: (text) {
                    context.read<LoginBloc>().add(EmailChanged(text));
                  },
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
                        .read<LoginBloc>()
                        .add(TogglePasswordVisibility()),
                  ),
                  hint: "Enter your password",
                  title: "Password",
                  onChanged: (text) {
                    context.read<LoginBloc>().add(PasswordChanged(text));
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: BodyMediumText(
                    "Forgot Password?",
                    color: theme.colorScheme.primary,
                    onTap: () {
                      context.read<LoginBloc>().add(ForgotPasswordPressed());
                    },
                  ),
                ),
              ]);
            },
          ),
          Column(
            spacing: 12,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: AppPrimaryButton(
                      text: "Login",
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginPressed());
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
                    'No Account Yet?',
                  ),
                  BodyMediumBoldText(
                    'Sign Up',
                    color: theme.colorScheme.primary,
                    onTap: () {
                      context.read<LoginBloc>().add(RegisterPressed());
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
