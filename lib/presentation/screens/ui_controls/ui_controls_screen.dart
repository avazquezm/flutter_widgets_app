import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'UiControlsScreen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Controles de UI y Tiles'),
        ),
        body: const _UiControlsView());
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, bus, train }

class _UiControlsViewState extends State<_UiControlsView> {
  bool _developerMode = false;
  Transportation _selectedTransportation = Transportation.car;
  bool _wantsBreakfast = false;
  bool _wantsLunch = false;
  bool _wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Habilita el modo desarrollador'),
          value: _developerMode,
          onChanged: (value) => setState(() => _developerMode = value),
        ),
        ExpansionTile(
          title: const Text('Transportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Vehículo privado'),
              value: Transportation.car,
              groupValue: _selectedTransportation,
              onChanged: (value) =>
                  setState(() => _selectedTransportation = Transportation.car),
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text('Vehículo de dos ruedas'),
              value: Transportation.bike,
              groupValue: _selectedTransportation,
              onChanged: (value) =>
                  setState(() => _selectedTransportation = Transportation.bike),
            ),
            RadioListTile(
              title: const Text('Bus'),
              subtitle: const Text('Transporte público'),
              value: Transportation.bus,
              groupValue: _selectedTransportation,
              onChanged: (value) =>
                  setState(() => _selectedTransportation = Transportation.bus),
            ),
            RadioListTile(
              title: const Text('Train'),
              subtitle: const Text('Transporte ferroviario'),
              value: Transportation.train,
              groupValue: _selectedTransportation,
              onChanged: (value) => setState(
                  () => _selectedTransportation = Transportation.train),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          subtitle: const Text('¿Quieres desayunar?'),
          value: _wantsBreakfast,
          onChanged: (value) =>
              setState(() => _wantsBreakfast = !_wantsBreakfast),
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          subtitle: const Text('¿Quieres almorzar?'),
          value: _wantsLunch,
          onChanged: (value) => setState(() => _wantsLunch = !_wantsLunch),
        ),
        CheckboxListTile(
          title: const Text('Dinner'),
          subtitle: const Text('¿Quieres cenar?'),
          value: _wantsDinner,
          onChanged: (value) => setState(() => _wantsDinner = !_wantsDinner),
        ),
      ],
    );
  }
}
