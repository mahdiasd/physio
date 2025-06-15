import 'dart:io';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return Image.network(
        source,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ??
              Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
        },
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? _defaultError();
        },
      );
    } else if (_isAsset) {
      return Image.asset(
        source,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? _defaultError();
        },
      );
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
      return errorWidget ?? _defaultError();
    }
  }

  Widget _defaultError() => Center(
    child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
  );
}
