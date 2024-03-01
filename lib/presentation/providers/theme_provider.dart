import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

// Inmutable color list
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider<int>((ref) => 0);

// An object of type AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
