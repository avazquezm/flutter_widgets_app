import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String image;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.image,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Encuentra una amplia variedad de opciones de comida. ¡Elige tu favorita!',
      image: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rápida',
      caption: 'Recibe tu comida en poco tiempo. ¡Rápido y fácil!',
      image: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta de la comida',
      caption: 'Saborea y disfruta de tu deliciosa comida. ¡Buen provecho!',
      image: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'AppTutorialScreen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final page = _pageController.page ?? 0;

      if (!_isLastPage && page >= slides.length - 1) {
        setState(() {
          _isLastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              children: slides.map((slide) {
                return _Slide(
                  title: slide.title,
                  caption: slide.caption,
                  image: slide.image,
                );
              }).toList()),
          Positioned(
            right: 20,
            top: 40,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Skip'),
            ),
          ),
          if (_isLastPage)
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeIn(
                child: FilledButton(
                  onPressed: () {
                    // Add your button logic here
                  },
                  child: const Text('Get Started'),
                ),
              ),
            ),
        ],
      ), // Add your widget code here
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String image;

  const _Slide({
    required this.title,
    required this.caption,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              textAlign: TextAlign.center,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
