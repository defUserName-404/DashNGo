import '../models/address.dart';

class AddressSearchService {
  Address pickupAddress;
  Address destinationAddress;

  AddressSearchService({
    required this.pickupAddress,
    required this.destinationAddress,
  });

  void updatePickupAddress(Address pickupAddress) {
    this.pickupAddress = pickupAddress;
  }

  void updateDestinationAddress(Address destinationAddress) {
    this.destinationAddress = destinationAddress;
  }
}
