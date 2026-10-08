import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get dark => _build(Brightness.dark);
  static ThemeData get light => _build(Brightness.light);

  static ThemeData _build(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.limeKick,
      brightness: brightness,
      primary: AppColors.limeKick,
      secondary: AppColors.goldWhistle,
      surface: dark ? AppColors.panel : AppColors.chalk,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: dark ? AppColors.pitchNight : AppColors.chalk,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: dark ? AppColors.panel : AppColors.chalk,
        indicatorColor: AppColors.limeKick.withValues(alpha: 0.28),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: dark ? AppColors.chalk : AppColors.ink),
        ),
      ),
    );
  }
}
