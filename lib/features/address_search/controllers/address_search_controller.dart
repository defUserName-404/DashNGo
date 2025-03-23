import 'package:flutter/material.dart';

import '../models/address.dart';
import '../services/address_search_service.dart';

class AddressSearchController extends ChangeNotifier {
  final AddressSearchService addressSearchService;

  AddressSearchController({required this.addressSearchService});

  void updatePickupAddress(Address pickupAddress) {
    addressSearchService.updatePickupAddress(pickupAddress);
    notifyListeners();
  }

  void updateDestinationAddress(Address destinationAddress) {
    addressSearchService.updateDestinationAddress(destinationAddress);
    notifyListeners();
  }
}
