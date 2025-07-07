import 'package:flutter/material.dart';

TextTheme appTextTheme = const TextTheme(
  // Page Header - SemiBold (600) - 36px
  displaySmall: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    fontFamily: 'ClashGrotesk-Semibold',
  ),

  // Web Big Card - date & Time - Medium (500) - 22px
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontFamily: 'ClashGrotesk-Medium',
  ),

  // Page Subtitle - Regular (400) - 20px
  headlineSmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  ),

  // Page Title - SemiBold (600) - 20px
  headlineMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'ClashGrotesk-Semibold',
  ),

  // Section Title - Medium (500) - 18px
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'ClashGrotesk-Medium',
  ),

  // Web Big Card - Detail - Regular (400) - 16px
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  ),

  // Main Button - Medium (500) - 16px
  labelLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'ClashGrotesk-Medium',
  ),

  // List Title - Medium (500) - 15px
  titleSmall: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'ClashGrotesk-Medium',
  ),

  // Body - Regular (400) - 14px + Placeholder - Regular (400) - 14px
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  ),

  // List Item Title (Big) - Regular (400) - 13px
  displayLarge: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  ),

  // List Item Subtitle (Big) - Regular (400) - 12px
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  ),

  // Bottom Navigation - Medium (500) - 12px
  labelMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'ClashGrotesk-Medium',
  ),

  // Captions - Regular (400) - 11px
  labelSmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  ),
);

extension CustomClashGroteskTextStyles on TextTheme {
  // Card Tile - SemiBold (600) - 14px
  TextStyle get cardTile => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'ClashGrotesk-Semibold',
  );

  // Button Downside Clickable - SemiBold (600) - 14px
  TextStyle get buttonDownside => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'ClashGrotesk-Semibold',
  );

  // Input Field Title - Regular (400) - 15px
  TextStyle get inputFieldTitle => const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  );

  // List Item Title - Regular (400) - 10px
  TextStyle get listItemTitle => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  );

  // List Item Subtitle - Regular (400) - 9px
  TextStyle get listItemSubtitle => const TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    fontFamily: 'ClashGrotesk-Regular',
  );

  // برای استفاده‌های خاص - Bold
  TextStyle get extraBold => const TextStyle(
    fontFamily: 'ClashGrotesk-Bold',
    fontWeight: FontWeight.w700,
  );

  // برای استفاده‌های خاص - Light
  TextStyle get light => const TextStyle(
    fontFamily: 'ClashGrotesk-Light',
    fontWeight: FontWeight.w300,
  );

  // برای استفاده‌های خاص - Extra Light
  TextStyle get extraLight => const TextStyle(
    fontFamily: 'ClashGrotesk-Extralight',
    fontWeight: FontWeight.w200,
  );
}

/*
╔═════════════════════════════════════════════════════════════════════╗
║                   Material 3 TextTheme Mapping                      ║
╠═════════════════════════════════════════════════════════════════════╣
║ Material 3 Style               │ وزن │ سایز │              توضیحات  ║
╠═════════════════════════════════════════════════════════════════════╣
║ Page Header                    │ displaySmall         │ 36px │ 600  ║
║ Web Big Card - date & Time     │ titleLarge           │ 22px │ 500  ║
║ Page Subtitle                  │ headlineSmall        │ 20px │ 400  ║
║ Page Title                     │ headlineMedium       │ 20px │ 600  ║
║ Section Title                  │ titleMedium          │ 18px │ 500  ║
║ Web Big Card - Detail          │ bodyLarge            │ 16px │ 400  ║
║ List Title                     │ titleSmall           │ 15px │ 500  ║
║ Main Button                    │ labelLarge           │ 16px │ 500  ║
║ Input Field Title              │ Extension Method     │ 15px │ 400  ║
║ Placeholder                    │ bodyMedium           │ 14px │ 400  ║
║ Card Tile                      │ Extension Method     │ 14px │ 600  ║
║ Body                           │ bodyMedium           │ 14px │ 400  ║
║ Button Downside Clickable      │ Extension Method     │ 14px │ 600  ║
║ Bottom Navigation              │ labelMedium          │ 12px │ 500  ║
║ List Item Title                │ Extension Method     │ 10px │ 400  ║
║ List Item Subtitle             │ Extension Method     │  9px │ 400  ║
║ List Item Title (Big)          │ displayLarge         │ 13px │ 400  ║
║ List Item Subtitle (Big)       │ bodySmall            │ 12px │ 400  ║
║ Captions                       │ labelSmall           │ 11px │ 400  ║
╚═════════════════════════════════════════════════════════════════════╝

Important notes:
• Styles that did not have a suitable Material 3 equivalent were placed in the Extension
• displayLarge was repurposed for List Item Title (Big) because it was the right size
• To use Extension methods: Theme.of(context).textTheme.cardTile
*/
