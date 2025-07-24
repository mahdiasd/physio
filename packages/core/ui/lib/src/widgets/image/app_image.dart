import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Color? tintColor;
  final double? rotationAngle;
  final VoidCallback? onTap;

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? backgroundPadding;
  final double? radius;

  const AppImage({
    super.key,
    required this.source,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.tintColor,
    this.rotationAngle,
    this.onTap,

    this.backgroundColor,
    this.borderRadius,
    this.shape,
    this.backgroundPadding,
    this.radius,
  });

  bool get _isNetwork => source.startsWith('http');
  bool get _isAsset => !source.startsWith('http') && !source.startsWith('/');
  bool get _isFile => source.startsWith('/');
  bool get _isSvg => source.endsWith('.svg');

  bool get _hasBackground => backgroundColor != null;

  BorderRadius get _effectiveBorderRadius {
    if (borderRadius != null) return borderRadius!;
    if (radius != null) return BorderRadius.circular(radius!);
    return BorderRadius.zero; // Default radius = 0
  }

  EdgeInsetsGeometry get _effectivePadding {
    return backgroundPadding ?? EdgeInsets.zero;
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = _buildImage(context);
    if (rotationAngle != null) {
      imageWidget = Transform.rotate(
        angle: rotationAngle! * (math.pi / 180),
        child: imageWidget,
      );
    }

    if (_hasBackground) {
      imageWidget = _buildBackgroundContainer(imageWidget);
    }

    if (onTap != null) {
      imageWidget = MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: imageWidget,
        ),
      );
    }

    return imageWidget;
  }

  Widget _buildImage(BuildContext context) {
    final iconThemeColor = IconTheme.of(context).color;
    final finalTintColor = tintColor ?? iconThemeColor;

    if (_isNetwork) {
      return _buildNetworkImage(finalTintColor);
    } else if (_isAsset) {
      return _buildAssetImage(finalTintColor);
    } else if (_isFile) {
      return _buildFileImage();
    } else {
      return errorWidget ?? _defaultError();
    }
  }

  Widget _buildNetworkImage(Color? finalTintColor) {
    if (_isSvg) {
      return SvgPicture.network(
        source,
        width: width,
        height: height,
        colorFilter: finalTintColor != null
            ? ColorFilter.mode(finalTintColor, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) => placeholder ?? _defaultPlaceholder(),
      );
    } else {
      return Image.network(
        source,
        width: width,
        height: height,
        fit: fit,
        color: tintColor,
        colorBlendMode: tintColor != null ? BlendMode.srcIn : null,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ?? _defaultPlaceholder();
        },
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? _defaultError();
        },
      );
    }
  }

  Widget _buildAssetImage(Color? finalTintColor) {
    if (_isSvg) {
      return SvgPicture.asset(
        source,
        width: width,
        height: height,
        colorFilter: finalTintColor != null
            ? ColorFilter.mode(finalTintColor, BlendMode.srcIn)
            : null,
      );
    } else {
      return Image.asset(
        source,
        width: width,
        height: height,
        fit: fit,
        color: tintColor,
        colorBlendMode: tintColor != null ? BlendMode.srcIn : null,
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? _defaultError();
        },
      );
    }
  }

  Widget _buildFileImage() {
    return Image.file(
      File(source),
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? _defaultError();
      },
    );
  }

  Widget _buildBackgroundContainer(Widget child) {
    if (shape != null) {
      return Container(
        padding: _effectivePadding,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: shape!,
        ),
        child: child,
      );
    } else {
      return Container(
        padding: _effectivePadding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: _effectiveBorderRadius,
        ),
        child: child,
      );
    }
  }

  Widget _defaultPlaceholder() => Center(
    child: SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(strokeWidth: 2),
    ),
  );

  Widget _defaultError() => Center(
    child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
  );
}