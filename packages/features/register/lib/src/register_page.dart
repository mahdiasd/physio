import 'package:flutter/material.dart';

/// {@template register_page}
/// A page that displays the register form.
/// {@endtemplate}
class RegisterPage extends StatelessWidget {
  final VoidCallback onToLogin;
  /// {@macro register_page}
  const RegisterPage({super.key, required this.onToLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onToLogin,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Your registration form widgets will go here
            const SizedBox(height: 16),
            TextButton(
              onPressed: onToLogin,
              child: const Text("Already have an account? Login here"),
            ),
          ],
        ),
      ),
    );
  }
} 