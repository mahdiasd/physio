import 'package:flutter/material.dart';

class AppRadius {
  /// Value = 0.0
  final double none = 0.0;

  /// Value = 4.0
  final double xSmall = 4.0;

  /// Value = 8.0
  final double small = 8.0;

  /// Value = 10.0
  final double medium = 10.0;

  /// Value = 12.0
  final double large = 12.0;

  /// Value = 16.0
  final double xLarge = 16.0;

  /// Value = 24.0
  final double xxLarge = 24.0;

  /// Value = 100.0
  final double full = 100.0;

  /// BorderRadius.circular(0.0)
  BorderRadius get noneAll => BorderRadius.circular(none);

  /// BorderRadius.circular(4.0)
  BorderRadius get xSmallAll => BorderRadius.circular(xSmall);

  /// BorderRadius.circular(8.0)
  BorderRadius get smallAll => BorderRadius.circular(small);

  /// BorderRadius.circular(10.0)
  BorderRadius get mediumAll => BorderRadius.circular(medium);

  /// BorderRadius.circular(12.0)
  BorderRadius get largeAll => BorderRadius.circular(large);

  /// BorderRadius.circular(16.0)
  BorderRadius get xLargeAll => BorderRadius.circular(xLarge);

  /// BorderRadius.circular(24.0)
  BorderRadius get xxLargeAll => BorderRadius.circular(xxLarge);

  /// BorderRadius.circular(100.0)
  BorderRadius get fullAll => BorderRadius.circular(full);
}