import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'ButtonsScreen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          }),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.alarm_on_rounded),
              label: const Text('Elevated Icon'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled Button'),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_circle_outlined),
              label: const Text('Filled Icon'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline_rounded),
              label: const Text('Outlined Icon'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.airplanemode_active_rounded),
              label: const Text('Text Icon'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_photo_alternate_outlined),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          splashColor: Colors.red,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom Button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
