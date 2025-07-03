import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../ui.dart';

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
  final String? title;
  final double titleSpacing;
  final FocusNode? focusNode;
  final String? label;

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
    this.title,
    this.titleSpacing = 8.0,
    this.label,
    this.focusNode,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  static const double _borderRadius = 10;
  static const double _borderWidth = 0.5;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();

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
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bool isClearVisible = widget.showClearIcon &&
        widget.value.isNotEmpty &&
        widget.enabled &&
        !widget.readOnly;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: theme.textTheme.inputFieldTitle,
          ),
          SizedBox(height: widget.titleSpacing),
        ],
        TextField(
          controller: _controller,
          focusNode: _focusNode,
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
            hintStyle: widget.placeholderStyle ?? theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF9A9A9A),
            ),
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerLow,
            errorText: widget.isError ? widget.errorText : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
              borderSide: const BorderSide(
                color: Color(0xFFE1E1E1),
                width: _borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: _borderWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: _borderWidth,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: _borderWidth,
              ),
            ),
            prefixIcon: widget.leadingIcon,
            suffixIcon: isClearVisible
                ? _buildClearIcon(context)
                : widget.trailingIcon,
          ),
          inputFormatters: widget.keyboardType == TextInputType.number &&
              widget.textAlign == TextAlign.center
              ? [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ]
              : null,
        ),
        if (widget.label != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.label!,
            style: theme.textTheme.labelSmall,
          ),
        ],
      ],
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
