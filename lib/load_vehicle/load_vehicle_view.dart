import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/load_vehicle/load_vehicle_viewmodel.dart';
import 'package:totem/load_vehicle/load_vehicle_model.dart';

// The main view for vehicle loading, provides UI to select vehicle, enter kilometers, and load license plate.
class LoadVehicleView extends StatelessWidget {
  const LoadVehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LoadVehicleViewModel>(
        create: (_) => LoadVehicleViewModel(),
        child: Consumer<LoadVehicleViewModel>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VehicleImageButton(
                      vehicleType: VehicleType.car,
                      isSelected: model.selectedVehicle == VehicleType.car,
                      onTap: () => model.selectVehicleType(VehicleType.car),
                    ),
                    VehicleImageButton(
                      vehicleType: VehicleType.suv,
                      isSelected: model.selectedVehicle == VehicleType.suv,
                      onTap: () => model.selectVehicleType(VehicleType.suv),
                    ),
                    VehicleImageButton(
                      vehicleType: VehicleType.bike,
                      isSelected: model.selectedVehicle == VehicleType.bike,
                      onTap: () => model.selectVehicleType(VehicleType.bike),
                    ),
                    const SizedBox(height: 20), // Spacing
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Ingrese KM',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          model.updateKilometers(int.tryParse(value) ?? 0),
                    ),
                    const SizedBox(height: 20), // Spacing
                    LicenseCodeInput(
                      onTap: () {
                        // TODO: Implement tap callback to show OCR modal
                      },
                      licenseCode: model.licenseCode,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: model.isContinueEnabled ? () {} : null,
                      child: const Text('Continue'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// A custom button that uses text as placeholders for vehicle images
class VehicleImageButton extends StatelessWidget {
  final VehicleType vehicleType;
  final bool isSelected;
  final VoidCallback onTap;

  const VehicleImageButton({
    super.key,
    required this.vehicleType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String vehicleText;
    switch (vehicleType) {
      case VehicleType.car:
        vehicleText = 'Car';
        break;
      case VehicleType.suv:
        vehicleText = 'SUV';
        break;
      case VehicleType.bike:
        vehicleText = 'Bike';
        break;
      default:
        vehicleText = 'Unknown';
    }

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: isSelected ? Colors.black : Colors.grey,
      ),
      child: Text(
        vehicleText,
        style: TextStyle(
          fontSize: 20.0,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class LicenseCodeInput extends StatelessWidget {
  final VoidCallback onTap;
  final String? licenseCode;

  const LicenseCodeInput({
    super.key,
    required this.onTap,
    this.licenseCode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          licenseCode ??
              'Tap to enter license plate', // Show placeholder text if licenseCode is null
          style: TextStyle(
            color: licenseCode != null ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
