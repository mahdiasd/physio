import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/src/widgets/text/body_text.dart';
import 'package:ui/src/widgets/text/label_text.dart';

const _borderRadius = 8.0;

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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();

    _controller.addListener(() {
      if (_controller.text != widget.value) {
        // For verification code inputs, limit to single digit
        if (widget.keyboardType == TextInputType.number &&
            widget.textAlign == TextAlign.center &&
            _controller.text.length > 1) {
          // Keep only the last entered digit
          final newValue = _controller.text.characters.last;
          _controller.value = TextEditingValue(
            text: newValue,
            selection: TextSelection.fromPosition(
              TextPosition(offset: newValue.length),
            ),
          );
          widget.onChanged(newValue);
        } else {
          widget.onChanged(_controller.text);
        }
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

    final isClearVisible = widget.showClearIcon &&
        widget.value.isNotEmpty &&
        widget.enabled &&
        !widget.readOnly;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          BodyMediumText(
            widget.title!,
          ),
          SizedBox(height: widget.titleSpacing),
        ],
        KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (KeyEvent event) {
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.backspace &&
                widget.keyboardType == TextInputType.number &&
                widget.textAlign == TextAlign.center &&
                _controller.text.isEmpty) {
              widget.onChanged('');
            }
          },
          child: TextField(
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
            inputFormatters: widget.keyboardType == TextInputType.number &&
                    widget.textAlign == TextAlign.center
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ]
                : null,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: widget.placeholderStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    color: theme.hintColor,
                  ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: theme.colorScheme.outlineVariant,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                ),
              ),
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHigh,
              errorText: widget.isError ? widget.errorText : null,
              prefixIcon: widget.leadingIcon ??
                  (isClearVisible ? _buildClearIcon(context) : null),
              suffixIcon: widget.trailingIcon,
            ),
          ),
        ),
        if (widget.label != null) ...[
          SizedBox(height: 4),
          LabelSmallText(
            widget.label!,
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
