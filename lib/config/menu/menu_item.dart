import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: ButtonsScreen.name,
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: CardsScreen.name,
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress indicators',
    subTitle: 'Generales y controlados',
    link: ProgressScreen.name,
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y diálogos',
    subTitle: 'Generales y controlados',
    link: SnackbarScreen.name,
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget con animaciones',
    link: AnimatedScreen.name,
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'Controles de UI y Tiles',
    subTitle: 'Varios controles de UI',
    link: UiControlsScreen.name,
    icon: Icons.settings,
  ),
  MenuItem(
    title: 'Tutorial de la app',
    subTitle: 'Aprende a usar la app',
    link: AppTutorialScreen.name,
    icon: Icons.school,
  ),
];
