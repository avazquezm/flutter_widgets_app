import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'AnimatedScreen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.indigo;
  double _borderRadius = 20.0;

  void _changeContainer() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble() + 50.0;
      _height = random.nextInt(400).toDouble() + 50.0;
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = random.nextInt(100).toDouble() + 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Animated container')),
        body: Center(
          child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.elasticInOut,
              width: _width < 0 ? 0 : _width,
              height: _height < 0 ? 0 : _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(
                    _borderRadius < 0 ? 0 : _borderRadius),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeContainer,
          child: const Icon(Icons.play_arrow),
        ));
  }
}
