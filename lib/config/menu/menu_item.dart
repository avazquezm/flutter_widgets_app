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
  )
];
