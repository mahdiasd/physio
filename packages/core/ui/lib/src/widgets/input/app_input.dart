import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String hint;
  final bool enabled;
  final bool readOnly;
  final bool isError;
  final int minLines;
  final int maxLines;
  final bool showClearIcon;
  final bool obscureText;
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
    this.showClearIcon = false,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.placeholderStyle,
    this.keyboardType = TextInputType.text,
    this.leadingIcon,
    this.trailingIcon,
    this.obscureText = false,
    this.errorText,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _controller.addListener(() {
      if (_controller.text != widget.value) {
        widget.onChanged(_controller.text);
      }
    });
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isClearVisible =
        widget.showClearIcon &&
            widget.value.isNotEmpty &&
            widget.enabled &&
            !widget.readOnly;

    return TextField(
      controller: _controller,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      style: widget.textStyle ?? theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.placeholderStyle ??
            theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHigh,
        errorText: widget.isError ? widget.errorText : null,
        prefixIcon: widget.leadingIcon ??
            (isClearVisible ? _buildClearIcon(context) : null),
        suffixIcon: widget.trailingIcon,
      ),
    );
  }

  Widget _buildClearIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.clear(),
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
