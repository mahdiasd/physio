import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utils/utils.dart';

import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onMain;
  const LoginPage({super.key, required this.onMain});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: LoginContent(onToRegister: onMain),
    );
  }
}

class LoginContent extends StatelessWidget {
  final VoidCallback onToRegister;
  const LoginContent({super.key, required this.onToRegister});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Your login form widgets will go here
            const SizedBox(height: 16),
            TextButton(
              onPressed: onToRegister,
              child: const Text("Don't have an account? Register here"),
            ),
          ],
        ),
      ),
    );
  }
}
