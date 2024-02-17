import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'SnackbarScreen';

  const SnackbarScreen({super.key});

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('¡Hola, soy un Snackbar!'),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Deshacer',
        onPressed: () {
          // Al presionar el botón de acción
        },
      ),
    );

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Título del diálogo'),
          content: const Text(
              'Contenido del diálogo. Se debe cerrar manualmente debido a barrierDismissible: false.'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'Widgets App',
                    applicationVersion: '1.0.0',
                    applicationIcon: const FlutterLogo(),
                    children: const [
                      Text(
                          'Esta es una aplicación de ejemplo para mostrar widgets.'),
                    ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                _showDialog(context);
              },
              child: const Text('Mostrar diálogo'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => _showSnackbar(context),
      ),
    );
  }
}
