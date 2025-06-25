import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String labelText;
  final String? errorText;
  final bool isError;

  const VerificationCodeField({
    super.key,
    required this.onChanged,
    required this.labelText,
    this.errorText,
    this.isError = false,
  });

  @override
  State<VerificationCodeField> createState() => _VerificationCodeFieldState();
}

class _VerificationCodeFieldState extends State<VerificationCodeField> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  bool _isAnyFocused = false;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 4; i++) {
      _focusNodes[i].addListener(() {
        setState(() {
          _isAnyFocused = _focusNodes.any((node) => node.hasFocus);
        });
      });
    }
  }

  void _onCodeChanged() {
    final code = _controllers.map((controller) => controller.text).join();
    widget.onChanged(code);
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHigh,
            border: Border.all(
              color: _isAnyFocused
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outlineVariant,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) => _buildCodeBox(index)),
          ),
        ),
        if (widget.isError && widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: theme.textTheme.labelSmall!
                .copyWith(color: theme.colorScheme.error),
          ),
        ],
      ],
    );
  }

  Widget _buildCodeBox(int index) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: index > 0
                ? BorderSide(color: theme.colorScheme.outlineVariant, width: 1)
                : BorderSide.none,
            right: index < 3
                ? BorderSide(color: theme.colorScheme.outlineVariant, width: 1)
                : BorderSide.none,
          ),
        ),
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textInputAction:
          index < 3 ? TextInputAction.next : TextInputAction.done,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            if (value.isNotEmpty && value.length == 1) {
              if (index < 3) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else {
                FocusScope.of(context).unfocus();
              }
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            }

            _onCodeChanged();
          },
        ),
      ),
    );
  }
}
