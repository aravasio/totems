import 'package:flutter/foundation.dart';
import 'package:totem/load_vehicle/load_vehicle_model.dart';

// Manages the state for the LoadVehicleView.
class LoadVehicleViewModel extends ChangeNotifier {
  VehicleInfo? _vehicleInfo;

  // Temporary variables to hold data until 'Continue' is clicked
  VehicleType? _tempType;
  VehicleType? get selectedVehicle => _tempType;

  int? _tempKilometers;
  int? get kilometers => _tempKilometers;

  String? _tempLicenseCode;
  String? get licenseCode => _tempLicenseCode;

  // Updates the selected vehicle type temporarily.
  void selectVehicleType(VehicleType type) {
    _tempType = type;
    notifyListeners();
  }

  // Temporarily updates the kilometers driven by the vehicle.
  void updateKilometers(int km) {
    _tempKilometers = km;
    notifyListeners();
  }

  // Temporarily updates the license plate after recognition.
  void updateLicensePlate(String plate) {
    _tempLicenseCode = plate;
    notifyListeners();
  }

  // Check if all required information is filled to enable the continue button.
  bool get isContinueEnabled =>
      _tempType != null &&
      _tempKilometers != null &&
      _tempKilometers! > 0 &&
      _tempLicenseCode != null &&
      _tempLicenseCode!.isNotEmpty;

// Call this method when the user clicks 'Continue'
  void finalizeVehicleInfo() {
    if (isContinueEnabled) {
      // This already checks all needed conditions
      _vehicleInfo = VehicleInfo(
          type: _tempType!,
          kilometers: _tempKilometers!,
          licenseCode: _tempLicenseCode!);
      notifyListeners();
    }
  }

  // Provides access to the current vehicle info, may be null if not finalized
  VehicleInfo? get vehicleInfo => _vehicleInfo;
}
