import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String hint;
  final bool enabled;
  final bool readOnly;
  final bool isError;
  final int minLines;
  final int maxLines;
  final bool showClearIcon;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final TextStyle? placeholderStyle;
  final TextInputType keyboardType;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? errorText;

  const AppTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.hint = '',
    this.enabled = true,
    this.readOnly = false,
    this.isError = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.showClearIcon = true,
    this.textDirection = TextDirection.rtl,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.placeholderStyle,
    this.keyboardType = TextInputType.text,
    this.leadingIcon,
    this.trailingIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isClearVisible = showClearIcon && value.isNotEmpty && enabled && !readOnly;

    return TextField(
      controller: TextEditingController(text: value),
      onChanged: onChanged,
      enabled: enabled,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textDirection: textDirection,
      textAlign: textAlign,
      style: textStyle ?? theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: placeholderStyle ?? theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceVariant,
        errorText: isError ? errorText : null,
        prefixIcon: leadingIcon ?? (isClearVisible ? _buildClearIcon(context) : null),
        suffixIcon: trailingIcon,
      ),
    );
  }

  Widget _buildClearIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(""),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.close, color: Colors.white, size: 18),
      ),
    );
  }
}

