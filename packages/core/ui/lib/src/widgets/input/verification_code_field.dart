import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeInput extends StatefulWidget {
  final String labelText;
  final bool isError;
  final String? errorText;
  final ValueChanged<String>? onChange;

  const VerificationCodeInput({
    super.key,
    required this.labelText,
    this.isError = false,
    this.errorText,
    this.onChange,
  });

  @override
  State<VerificationCodeInput> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
    _focusNodes = List.generate(4, (_) => FocusNode());

    for (int i = 0; i < 4; i++) {
      _focusNodes[i].addListener(() {
        setState(() {}); // Rebuild when focus changes for border update
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged() {
    final code = _controllers.map((c) => c.text).join();
    widget.onChange?.call(code);
  }

  Widget _buildCodeBox(int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isFocused = _focusNodes[index].hasFocus;

    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow, // Background #EFF6F5
          border: Border.all(
            color: isFocused
                ? colorScheme.primary // Focused border
                : const Color(0xFFE1E1E1), // Default border #E1E1E1
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10), // 10px radius
        ),
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textInputAction:
          index < 3 ? TextInputAction.next : TextInputAction.done,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF3D3D3D), // Input text color #3D3D3D
          ),
          maxLength: 1,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "", // Optional: single char placeholder
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF9A9A9A), // Placeholder color #9A9A9A
            ),
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            if (value.length == 1 && index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            } else if (value.length == 1 && index == 3) {
              FocusScope.of(context).unfocus();
            }
            _onCodeChanged();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text above the input fields
        Text(widget.labelText, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 8),
        Row(
          children: [
            for (int i = 0; i < 4; i++) ...[
              if (i > 0) const SizedBox(width: 12), // Spacing between boxes
              _buildCodeBox(i),
            ],
          ],
        ),
        if (widget.isError && widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }
}