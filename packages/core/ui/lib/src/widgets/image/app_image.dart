import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

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
  });

  bool get _isNetwork => source.startsWith('http');
  bool get _isAsset => !source.startsWith('http') && !source.startsWith('/');
  bool get _isFile => source.startsWith('/');
  bool get _isSvg => source.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    final iconThemeColor = IconTheme.of(context).color;
    final finalTintColor = tintColor ?? iconThemeColor;

    if (_isNetwork) {
      if (_isSvg) {
        imageWidget = SvgPicture.network(
          source,
          width: width,
          height: height,
          colorFilter: finalTintColor != null ? ColorFilter.mode(finalTintColor, BlendMode.srcIn) : null,
          placeholderBuilder: (context) => placeholder ?? _defaultPlaceholder(),
        );
      } else {
        imageWidget = Image.network(
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
    } else if (_isAsset) {
      if (_isSvg) {
        imageWidget = SvgPicture.asset(
          source,
          width: width,
          height: height,
          colorFilter: finalTintColor != null ? ColorFilter.mode(finalTintColor, BlendMode.srcIn) : null,
        );
      } else {
        imageWidget = Image.asset(
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
    } else if (_isFile) {
      return Image.file(
        File(source),
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? _defaultError();
        },
      );
    } else {
      imageWidget = errorWidget ?? _defaultError();
    }

    if (rotationAngle != null) {
      imageWidget = Transform.rotate(
        angle: rotationAngle! * (math.pi / 180),
        child: imageWidget,
      );
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