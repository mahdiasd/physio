import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/src/theme/theme_data.dart';

import '../../theme/custom_colors.dart';

class AppTextField extends StatefulWidget {
  // Required parameters
  final String value;
  final ValueChanged<String> onChanged;

  // Text configuration
  final String hint;
  final String? title;
  final String? label;
  final String? errorText;
  final double titleSpacing;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final int minLines;
  final int maxLines;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  // State configuration
  final bool enabled;
  final bool readOnly;
  final bool isError;
  final bool showClearIcon;

  // Visual configuration - Colors
  final Color? textColor;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final Color? disabledBorderColor;
  final Color? clearIconBackgroundColor;
  final Color? clearIconColor;

  // Visual configuration - Styles
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;

  // Visual configuration - Layout
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  // Focus
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  const AppTextField({
    super.key,
    required this.value,
    required this.onChanged,

    // Text configuration
    this.hint = '',
    this.title,
    this.label,
    this.errorText,
    this.titleSpacing = 8.0,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.minLines = 1,
    this.maxLines = 1,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,

    // State configuration
    this.enabled = true,
    this.readOnly = false,
    this.isError = false,
    this.showClearIcon = false,

    // Visual configuration - Colors
    this.textColor,
    this.hintColor,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.disabledBorderColor,
    this.clearIconBackgroundColor,
    this.clearIconColor,

    // Visual configuration - Styles
    this.textStyle,
    this.hintStyle,
    this.titleStyle,
    this.labelStyle,
    this.errorStyle,

    // Visual configuration - Layout
    this.borderRadius,
    this.borderWidth,
    this.contentPadding,
    this.leadingIcon,
    this.trailingIcon,

    // Focus & Callbacks
    this.focusNode,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  // Default values
  static const double _defaultBorderRadius = 10.0;
  static const double _defaultBorderWidth = 0.5;
  static const EdgeInsetsGeometry _defaultContentPadding = EdgeInsets.symmetric(
    vertical: 14,
    horizontal: 12,
  );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();

    _controller.addListener(_onTextChanged);
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
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    if (_controller.text != widget.value) {
      widget.onChanged(_controller.text);
    }
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final customColors = theme.customColors;

    final colors = _AppTextFieldColors.resolve(
      theme: theme,
      colorScheme: colorScheme,
      customColors: customColors,
      widget: widget,
    );

    final styles = _AppTextFieldStyles.resolve(
      textTheme: textTheme,
      colors: colors,
      widget: widget,
    );

    final layout = _AppTextFieldLayout.resolve(
      theme: theme,
      widget: widget,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: styles.title,
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
          style: styles.text,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
          inputFormatters: _buildInputFormatters(),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: styles.hint,
            filled: true,
            fillColor: colors.background,
            errorText: widget.isError ? widget.errorText : null,
            errorStyle: styles.error,
            contentPadding: layout.contentPadding,
            enabledBorder: _buildBorder(colors.border, layout),
            focusedBorder: _buildBorder(colors.focusedBorder, layout),
            errorBorder: _buildBorder(colors.errorBorder, layout),
            focusedErrorBorder: _buildBorder(colors.errorBorder, layout),
            disabledBorder: _buildBorder(colors.disabledBorder, layout),
            prefixIcon: widget.leadingIcon,
            suffixIcon: _buildSuffixIcon(colors),
          ),
        ),

        if (widget.label != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.label!,
            style: styles.label,
          ),
        ],
      ],
    );
  }

  List<TextInputFormatter>? _buildInputFormatters() {
    if (widget.inputFormatters != null) {
      return widget.inputFormatters;
    }

    // Auto-apply formatters for specific cases
    if (widget.keyboardType == TextInputType.number &&
        widget.textAlign == TextAlign.center) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ];
    }

    return null;
  }

  OutlineInputBorder _buildBorder(Color color, _AppTextFieldLayout layout) {
    return OutlineInputBorder(
      borderRadius: layout.borderRadius,
      borderSide: BorderSide(
        color: color,
        width: layout.borderWidth,
      ),
    );
  }

  Widget? _buildSuffixIcon(_AppTextFieldColors colors) {
    final bool isClearVisible = widget.showClearIcon &&
        widget.value.isNotEmpty &&
        widget.enabled &&
        !widget.readOnly;

    if (isClearVisible) {
      return GestureDetector(
        onTap: _clearText,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colors.clearIconBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.close,
            color: colors.clearIcon,
            size: 18,
          ),
        ),
      );
    }

    return widget.trailingIcon;
  }
}

// Helper class for managing colors
class _AppTextFieldColors {
  final Color text;
  final Color hint;
  final Color background;
  final Color border;
  final Color focusedBorder;
  final Color errorBorder;
  final Color disabledBackground;
  final Color disabledText;
  final Color disabledBorder;
  final Color clearIconBackground;
  final Color clearIcon;

  const _AppTextFieldColors({
    required this.text,
    required this.hint,
    required this.background,
    required this.border,
    required this.focusedBorder,
    required this.errorBorder,
    required this.disabledBackground,
    required this.disabledText,
    required this.disabledBorder,
    required this.clearIconBackground,
    required this.clearIcon,
  });

  static _AppTextFieldColors resolve({
    required ThemeData theme,
    required ColorScheme colorScheme,
    required CustomColors customColors,
    required AppTextField widget,
  }) {
    return _AppTextFieldColors(
      text: widget.enabled
          ? (widget.textColor ?? colorScheme.onSurface)
          : (widget.disabledTextColor ?? customColors.disabled),
      hint: widget.hintColor ?? customColors.placeholder,
      background: widget.enabled
          ? (widget.backgroundColor ?? colorScheme.surfaceContainerLow)
          : (widget.disabledBackgroundColor ?? customColors.disabled.withValues(alpha: 0.1)),
      border: widget.borderColor ?? colorScheme.outline,
      focusedBorder: widget.focusedBorderColor ?? colorScheme.primary,
      errorBorder: widget.errorBorderColor ?? colorScheme.error,
      disabledBackground: widget.disabledBackgroundColor ?? customColors.disabled.withValues(alpha: 0.1),
      disabledText: widget.disabledTextColor ?? customColors.disabled,
      disabledBorder: widget.disabledBorderColor ?? customColors.disabled,
      clearIconBackground: widget.clearIconBackgroundColor ?? colorScheme.primary,
      clearIcon: widget.clearIconColor ?? colorScheme.onPrimary,
    );
  }
}

class _AppTextFieldStyles {
  final TextStyle text;
  final TextStyle hint;
  final TextStyle title;
  final TextStyle label;
  final TextStyle? error;

  const _AppTextFieldStyles({
    required this.text,
    required this.hint,
    required this.title,
    required this.label,
    this.error,
  });

  static _AppTextFieldStyles resolve({
    required TextTheme textTheme,
    required _AppTextFieldColors colors,
    required AppTextField widget,
  }) {
    return _AppTextFieldStyles(
      text: widget.textStyle ??
          textTheme.bodyMedium?.copyWith(color: colors.text) ??
          TextStyle(color: colors.text),
      hint: widget.hintStyle ??
          textTheme.bodyMedium?.copyWith(color: colors.hint) ??
          TextStyle(color: colors.hint),
      title: widget.titleStyle ??
          textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(fontWeight: FontWeight.w600),
      label: widget.labelStyle ??
          textTheme.labelSmall ??
          const TextStyle(fontSize: 12),
      error: widget.errorStyle,
    );
  }
}

// Helper class for managing layout properties
class _AppTextFieldLayout {
  final BorderRadius borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry contentPadding;

  const _AppTextFieldLayout({
    required this.borderRadius,
    required this.borderWidth,
    required this.contentPadding,
  });

  static _AppTextFieldLayout resolve({
    required ThemeData theme,
    required AppTextField widget,
  }) {
    return _AppTextFieldLayout(
      borderRadius: widget.borderRadius ??
          BorderRadius.circular(_AppTextFieldState._defaultBorderRadius),
      borderWidth: widget.borderWidth ?? _AppTextFieldState._defaultBorderWidth,
      contentPadding: widget.contentPadding ?? _AppTextFieldState._defaultContentPadding,
    );
  }
}
