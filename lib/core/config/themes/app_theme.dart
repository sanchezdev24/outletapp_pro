import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'material_theme.dart';

class AppTheme {
  static TextTheme createTextTheme(
      BuildContext context, String bodyFontString, String displayFontString) {
    TextTheme baseTextTheme = Theme.of(context).textTheme;
    TextTheme bodyTextTheme =
        GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
    TextTheme displayTextTheme =
        GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
    TextTheme textTheme = displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );
    return textTheme;
  }

  static ThemeData getTheme(BuildContext context, bool isDark) {
    final textTheme = createTextTheme(context, "Adamina", "Adamina");
    final materialTheme = MaterialTheme(textTheme);
    return isDark ? materialTheme.dark() : materialTheme.light();
  }
}