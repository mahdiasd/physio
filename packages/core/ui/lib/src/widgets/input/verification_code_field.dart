import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../ui.dart';

class VerificationCodeInput extends StatefulWidget {
  final String title;
  final bool isError;
  final String? errorText;
  final ValueChanged<String>? onChange;

  const VerificationCodeInput({
    super.key,
    required this.title,
    this.isError = false,
    this.errorText,
    this.onChange,
  });

  @override
  State<VerificationCodeInput> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  late List<String> _values;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _values = List.generate(4, (_) => '');
    _focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged() {
    final code = _values.join();
    widget.onChange?.call(code);
  }

  void _handleValueChange(int index, String value) {
    setState(() {
      _values[index] = value;
    });

    if (value.length == 1 && index < 3) {
      // Move to next field
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      // Move to previous field on delete
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    } else if (value.length == 1 && index == 3) {
      // Unfocus on last field
      FocusScope.of(context).unfocus();
    }

    _onCodeChanged();
  }

  Widget _buildCodeBox(int index) {
    return Expanded(
      child: AppTextField(
        value: _values[index],
        onChanged: (value) => _handleValueChange(index, value),
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLines: 1,
        hint: '',
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 0,
        ),
        showClearIcon: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputFieldTitleText(widget.title),
        Row(
          spacing: 17,
          children: [
            for (int i = 0; i < 4; i++) ...[
              _buildCodeBox(i),
            ],
          ],
        ),
      ],
    );
  }
}
