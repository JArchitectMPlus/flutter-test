import 'package:flutter/material.dart';

const String gothamFontFamily = 'Gotham';
extension TextStyleHelper on BuildContext {
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get labelSmallBold => labelSmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelMediumBold => labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelLargeBold => labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall?.copyWith(
        fontSize: 14,
      );
  TextStyle? get bodySmallBold => bodySmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
        fontSize: 14,
      );
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium?.copyWith(
        fontSize: 16,
      );
  TextStyle? get bodyMediumBold => bodyMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
        fontSize: 16,
      );

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge?.copyWith(
        fontSize: 18,
      );
  TextStyle? get bodyLargeBold => bodyLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
        fontSize: 18,
      );
  TextStyle? get headlineLarge =>
      Theme.of(this).textTheme.headlineLarge?.copyWith(
            fontSize: 24,
          );
  TextStyle? get headlineLargeBold => headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get headlineMedium =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(
            fontSize: 22,
          );
  TextStyle? get headlineMediumBold => headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get headlineSmall =>
      Theme.of(this).textTheme.headlineSmall?.copyWith(
            fontSize: 20,
          );
  TextStyle? get headlineSmallBold => headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayLargeBold => displayLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displayMediumBold => displayMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get displaySmallBold => displaySmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleLargeBold => titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleMediumBold => titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get titleSmallBold => titleSmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: gothamFontFamily,
      );
}

extension ColorScemeHelper on BuildContext {
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get background => Theme.of(this).colorScheme.background;
  Color get dividerColor => Theme.of(this).dividerColor;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get tertiary => Theme.of(this).colorScheme.tertiary;
}

extension TextStyleColorHelper on TextStyle {
  Color? get opacity75 => color?.withOpacity(0.75);
  Color? get opacity50 => color?.withOpacity(0.50);
  Color? get opacity25 => color?.withOpacity(0.25);
  Color? get opacity11 => color?.withOpacity(0.11);
}
