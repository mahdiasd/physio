import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  final Widget child;
  final VoidCallback onHomePressed;
  final VoidCallback onLibraryPressed;
  final VoidCallback onProgramsPressed;
  final VoidCallback onAppointmentsPressed;
  final VoidCallback onAccountPressed;
  
  const MainPage({
    super.key, 
    required this.child,
    required this.onHomePressed,
    required this.onLibraryPressed,
    required this.onProgramsPressed,
    required this.onAppointmentsPressed,
    required this.onAccountPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(),
      child: MainContent(
        child: child,
        onHomePressed: onHomePressed,
        onLibraryPressed: onLibraryPressed,
        onProgramsPressed: onProgramsPressed,
        onAppointmentsPressed: onAppointmentsPressed,
        onAccountPressed: onAccountPressed,
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final Widget child;
  final VoidCallback onHomePressed;
  final VoidCallback onLibraryPressed;
  final VoidCallback onProgramsPressed;
  final VoidCallback onAppointmentsPressed;
  final VoidCallback onAccountPressed;
  
  const MainContent({
    super.key, 
    required this.child,
    required this.onHomePressed,
    required this.onLibraryPressed,
    required this.onProgramsPressed,
    required this.onAppointmentsPressed,
    required this.onAccountPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Row(
        children: [
          // Navigation sidebar
          Container(
            width: 200,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNavigationButton(
                  context,
                  'Home',
                  onHomePressed,
                ),
                const SizedBox(height: 16),
                _buildNavigationButton(
                  context,
                  'Library',
                  onLibraryPressed,
                ),
                const SizedBox(height: 16),
                _buildNavigationButton(
                  context,
                  'Programs',
                  onProgramsPressed,
                ),
                const SizedBox(height: 16),
                _buildNavigationButton(
                  context,
                  'Appointments',
                  onAppointmentsPressed,
                ),
                const SizedBox(height: 16),
                _buildNavigationButton(
                  context,
                  'Account',
                  onAccountPressed,
                ),
              ],
            ),
          ),
          // Main content area
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(180, 50),
      ),
      child: Text(label),
    );
  }
} 