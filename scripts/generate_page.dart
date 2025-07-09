import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart generate_feature_files.dart <PageName>');
    print('Example: dart generate_feature_files.dart Search');
    exit(1);
  }

  final pageName = args[0];
  final snakeCaseName = toSnakeCase(pageName);

  // Get current directory
  final currentDir = Directory.current;

  print('Generating files for: $pageName...');

  // Create directories
  Directory('${currentDir.path}/lib/src/bloc').createSync(recursive: true);
  Directory('${currentDir.path}/lib/src/di').createSync(recursive: true);

  // Generate files
  generateBlocFile('${currentDir.path}/lib/src/bloc', pageName, snakeCaseName);
  generateEffectFile('${currentDir.path}/lib/src/bloc', pageName, snakeCaseName);
  generateEventFile('${currentDir.path}/lib/src/bloc', pageName, snakeCaseName);
  generateStateFile('${currentDir.path}/lib/src/bloc', pageName, snakeCaseName);
  generateDiFile('${currentDir.path}/lib/src/di', pageName, snakeCaseName);
  generatePageFile('${currentDir.path}/lib', pageName, snakeCaseName);

  print('✅ Files generated successfully!');
}

void generateBlocFile(String path, String pageName, String snakeCaseName) {
  final content = '''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';

// TODO: Import your use cases

import '${snakeCaseName}_effect.dart';
import '${snakeCaseName}_event.dart';
import '${snakeCaseName}_state.dart';

@injectable
class ${pageName}Bloc extends Bloc<${pageName}Event, ${pageName}State>
    with SideEffectMixin<${pageName}State, ${pageName}Effect> {
  // TODO: Add your use cases here
  // final SomeUseCase _someUseCase;

  ${pageName}Bloc() : super(${pageName}State()) {
    // TODO: Register your event handlers
    // on<SomeEvent>(_onSomeEvent);
  }

  // TODO: Implement your event handlers
  /*
  Future<void> _onSomeEvent(
    SomeEvent event,
    Emitter<${pageName}State> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    
    // TODO: Implement your logic
    
    emit(state.copyWith(isLoading: false));
  }
  */
}
''';

  File('$path/${snakeCaseName}_bloc.dart').writeAsStringSync(content);
}

void generateEffectFile(String path, String pageName, String snakeCaseName) {
  final content = '''
sealed class ${pageName}Effect {}

class NavigateBack extends ${pageName}Effect {}

// TODO: Add more effects as needed
// class NavigateToSomePage extends ${pageName}Effect {}
''';

  File('$path/${snakeCaseName}_effect.dart').writeAsStringSync(content);
}

void generateEventFile(String path, String pageName, String snakeCaseName) {
  final content = '''
sealed class ${pageName}Event {}

// TODO: Add your events
// class SomeFieldChanged extends ${pageName}Event {
//   final String value;
//   SomeFieldChanged(this.value);
// }
//
// class SubmitButtonClicked extends ${pageName}Event {}
''';

  File('$path/${snakeCaseName}_event.dart').writeAsStringSync(content);
}

void generateStateFile(String path, String pageName, String snakeCaseName) {
  final content = '''
class ${pageName}State {
  final bool isLoading;
  // TODO: Add more state properties

  ${pageName}State({
    this.isLoading = false,
    // TODO: Initialize more properties
  });

  ${pageName}State copyWith({
    bool? isLoading,
    // TODO: Add more copyWith parameters
  }) {
    return ${pageName}State(
      isLoading: isLoading ?? this.isLoading,
      // TODO: Copy more properties
    );
  }
}
''';

  File('$path/${snakeCaseName}_state.dart').writeAsStringSync(content);
}

void generateDiFile(String path, String pageName, String snakeCaseName) {
  final content = '''
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage()
void init${pageName}MicroPackage() {}
''';

  File('$path/${snakeCaseName}_di.dart').writeAsStringSync(content);
}

void generatePageFile(String path, String pageName, String snakeCaseName) {
  final content = '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'src/bloc/${snakeCaseName}_bloc.dart';
import 'src/bloc/${snakeCaseName}_effect.dart';
import 'src/bloc/${snakeCaseName}_event.dart';
import 'src/bloc/${snakeCaseName}_state.dart';

class ${pageName}Page extends StatelessWidget {
  final VoidCallback navigateBack;
  // TODO: Add more navigation callbacks as needed

  const ${pageName}Page({
    super.key,
    required this.navigateBack,
    // TODO: Add more required callbacks
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<${pageName}Bloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: navigateBack,
        // TODO: Add more effect handlers
      },
      child: ${pageName}Content(),
    );
  }
}

class ${pageName}Content extends StatelessWidget {
  const ${pageName}Content({super.key});

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
                constraints:
                    BoxConstraints(maxWidth: 500, maxHeight: double.infinity),
                child: AdaptiveFormLayout(
                  child: ${pageName}Form(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ${pageName}Form extends StatelessWidget {
  const ${pageName}Form({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: isMobile
          ? _buildMobileLayout(context, theme)
          : _buildWebLayout(context, theme),
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return OverflowDetectingColumn(
      spacing: 100,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeader(context),
        _buildFormFields(context),
        _buildActions(context, theme),
      ],
    );
  }

  Widget _buildWebLayout(BuildContext context, ThemeData theme) {
    return OverflowDetectingColumn(
      spacing: 120,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildHeader(context),
        _buildFormFields(context),
        _buildActions(context, theme),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        DisplayLargeText(
          "TODO: Add Page Title",
          textAlign: TextAlign.center,
          color: Theme.of(context).colorScheme.primary,
        ),
        if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
          HeadlineSmallText(
            textAlign: TextAlign.center,
            "TODO: Add page description",
          ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return BlocBuilder<${pageName}Bloc, ${pageName}State>(
      builder: (context, state) {
        return Column(
          spacing: 24,
          children: [
            // TODO: Add your form fields here
            /*
            AppTextField(
              value: state.someField,
              keyboardType: TextInputType.text,
              maxLines: 1,
              hint: "Enter something",
              title: "Field Title",
              onChanged: (text) {
                context.read<${pageName}Bloc>().add(SomeFieldChanged(text));
              },
            ),
            */
          ],
        );
      },
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme) {
    return Column(
      spacing: 12,
      children: [
        BlocBuilder<${pageName}Bloc, ${pageName}State>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                text: "Continue",
                onPressed: () {
                  // TODO: Add button action
                  // context.read<${pageName}Bloc>().add(SubmitButtonClicked());
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
''';

  File('$path/${snakeCaseName}_page.dart').writeAsStringSync(content);
}

String toSnakeCase(String text) {
  return text
      .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)}')
      .toLowerCase()
      .replaceFirst(RegExp(r'^_'), '');
}