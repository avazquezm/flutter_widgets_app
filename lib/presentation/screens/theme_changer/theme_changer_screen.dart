import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'ThemeChangerScreen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode =
        ref.watch(themeNotifierProvider.select((value) => value.isDarkMode));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor =
        ref.watch(themeNotifierProvider.select((value) => value.selectedColor));

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];

          return RadioListTile<int>(
            title: Text(
              'This color',
              style: TextStyle(color: color),
            ),
            subtitle: Text('#${color.value.toRadixString(16)}'),
            activeColor: color,
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              ref.read(themeNotifierProvider.notifier).changeColor(index);
            },
          );
        });
  }
}
