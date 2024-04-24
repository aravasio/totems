// Represents different types of vehicles.
enum VehicleType { car, suv, bike }

// Holds information about the vehicle, including type, kilometers, and license plate.
class VehicleInfo {
  VehicleType type;
  int kilometers;
  String licenseCode;

  VehicleInfo(
      {required this.type,
      required this.kilometers,
      required this.licenseCode});
}
