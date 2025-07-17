import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

import '../../../ui.dart';

void successToast({
  required String title ,
  required String description ,
  AlignmentGeometry alignment = Alignment.bottomCenter,
  Duration autoCloseDuration = const Duration(seconds: 4),
  BorderRadiusGeometry? borderRadius,
  List<BoxShadow>? boxShadow,
  bool showProgressBar = true,
  bool dragToClose = true,
  bool applyBlurEffect = false,
}) {
  toastification.show(
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    title: HeadlineMediumText(title),
    description: BodyText(description),
    alignment: alignment,
    autoCloseDuration: autoCloseDuration,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    borderRadius: borderRadius ?? BorderRadius.circular(12.0),
    boxShadow: boxShadow ?? lowModeShadow,
    showProgressBar: showProgressBar,
    dragToClose: dragToClose,
    applyBlurEffect: applyBlurEffect,
  );
}

void errorToast({
  required String title ,
  required String description ,
  AlignmentGeometry alignment = Alignment.bottomCenter,
  Duration autoCloseDuration = const Duration(seconds: 4),
  BorderRadiusGeometry? borderRadius,
  List<BoxShadow>? boxShadow,
  bool showProgressBar = true,
  bool dragToClose = true,
  bool applyBlurEffect = false,
}) {
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    title: HeadlineMediumText(title),
    description: BodyText(description),
    alignment: alignment,
    autoCloseDuration: autoCloseDuration,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    borderRadius: borderRadius ?? BorderRadius.circular(12.0),
    boxShadow: boxShadow ?? lowModeShadow,
    showProgressBar: showProgressBar,
    dragToClose: dragToClose,
    applyBlurEffect: applyBlurEffect,
  );
}

void warningToast({
  required String title ,
  required String description ,
  AlignmentGeometry alignment = Alignment.bottomCenter,
  Duration autoCloseDuration = const Duration(seconds: 4),
  BorderRadiusGeometry? borderRadius,
  List<BoxShadow>? boxShadow,
  bool showProgressBar = true,
  bool dragToClose = true,
  bool applyBlurEffect = false,
}) {
  toastification.show(
    type: ToastificationType.warning,
    style: ToastificationStyle.flat,
    title: HeadlineMediumText(title),
    description: BodyText(description),
    alignment: alignment,
    autoCloseDuration: autoCloseDuration,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    borderRadius: borderRadius ?? BorderRadius.circular(12.0),
    boxShadow: boxShadow ?? lowModeShadow,
    showProgressBar: showProgressBar,
    dragToClose: dragToClose,
    applyBlurEffect: applyBlurEffect,
  );
}
