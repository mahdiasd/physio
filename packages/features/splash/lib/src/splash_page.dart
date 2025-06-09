import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utils/utils.dart';

import 'bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onMain;

  const SplashPage({super.key, required this.onLogin, required this.onMain});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashBloc>(),
      child: SplashContent(),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
