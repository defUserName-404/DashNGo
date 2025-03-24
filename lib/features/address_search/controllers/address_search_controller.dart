import 'package:flutter/material.dart';

import '../models/address.dart';

class AddressSearchController extends ChangeNotifier {
  Address? _pickupAddress;
  Address? _destinationAddress;

  Address? get pickupAddress => _pickupAddress;
  Address? get destinationAddress => _destinationAddress;

  void updatePickupAddress(Address pickupAddress) {
    _pickupAddress = pickupAddress;
    notifyListeners();
  }

  void updateDestinationAddress(Address destinationAddress) {
    _destinationAddress = destinationAddress;
    notifyListeners();
  }
}
