import 'dart:io';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppImage({
    super.key,
    required this.source,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  bool get _isNetwork => source.startsWith('http');
  bool get _isAsset => !source.startsWith('http') && !source.startsWith('/');
  bool get _isFile => source.startsWith('/');
  bool get _isSvg => source.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      if (_isSvg) {
        return SvgPicture.network(
          source,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (context) => placeholder ?? _defaultLoading(),
        );
      } else {
        return Image.network(
          source,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return placeholder ?? _defaultLoading();
          },
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ?? _defaultError();
          },
        );
      }
    } else if (_isAsset) {
      if (_isSvg) {
        return SvgPicture.asset(
          source,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (context) => placeholder ?? _defaultLoading(),
          colorFilter: null, // در صورت نیاز می‌تونی ColorFilter بذاری
        );
      } else {
        return Image.asset(
          source,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ?? _defaultError();
          },
        );
      }
    } else if (_isFile) {
      if (_isSvg) {
        return SvgPicture.file(
          File(source),
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (context) => placeholder ?? _defaultLoading(),
        );
      } else {
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
    } else {
      return errorWidget ?? _defaultError();
    }
  }

  Widget _defaultLoading() => Center(
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

