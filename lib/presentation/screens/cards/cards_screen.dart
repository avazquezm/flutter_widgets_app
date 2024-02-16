import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const name = 'CardsScreen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) =>
              _CardType1(elevation: card['elevation'], label: card['label'])),
          ...cards.map((card) =>
              _CardType2(elevation: card['elevation'], label: card['label'])),
          ...cards.map((card) =>
              _CardType3(elevation: card['elevation'], label: card['label'])),
          ...cards.map((card) =>
              _CardType4(elevation: card['elevation'], label: card['label'])),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({required this.elevation, required this.label});

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(label),
          ),
        ]),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  const _CardType2({required this.elevation, required this.label});

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: colors.primary,
          width: 2,
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('$label - outlined'),
          ),
        ]),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  const _CardType3({required this.elevation, required this.label});

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('$label - filled'),
          ),
        ]),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  const _CardType4({required this.elevation, required this.label});

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(children: [
        Image.network(
          'https://picsum.photos/id/${elevation.toInt()}/600/250',
          height: 250,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: Text('$label - filled'),
        // ),
      ]),
    );
  }
}
