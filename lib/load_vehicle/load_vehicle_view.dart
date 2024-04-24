import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/load_vehicle/load_vehicle_viewmodel.dart';

// The main view for vehicle loading, provides UI to select vehicle, enter kilometers, and load license plate.
class LoadVehicleView extends StatelessWidget {
  // Adding a key parameter to the constructor.
  const LoadVehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoadVehicleViewModel>(
      create: (_) => LoadVehicleViewModel(),
      child: Consumer<LoadVehicleViewModel>(
        builder: (context, model, child) {
          return Column(
            children: [
              // UI components like buttons and text fields would be added here.
              ElevatedButton(
                onPressed: model.isContinueEnabled ? () {} : null,
                child: const Text('Continue'),
              ),
            ],
          );
        },
      ),
    );
  }
}
