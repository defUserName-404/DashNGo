import 'dart:developer';

import 'package:dash_n_go/features/address_search/controllers/address_search_controller.dart';
import 'package:dash_n_go/features/address_search/models/address.dart';
import 'package:dash_n_go/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/address_search_textfield_widget.dart';

class AddressSearchScreen extends StatefulWidget {
  const AddressSearchScreen({super.key});

  @override
  State<AddressSearchScreen> createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  late final TextEditingController _pickupAddressController;
  late final TextEditingController _destinationAddressController;

  @override
  void initState() {
    _pickupAddressController = TextEditingController();
    _destinationAddressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pickupAddressController.dispose();
    _destinationAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AddressSearchController addressSearchController =
        Provider.of<AddressSearchController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Search Screen')),
      body: SizedBox(
        width: double.infinity,
        height: 220,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                LocationSearchingWidget(
                  controller: _pickupAddressController,
                  imageAssetPath: 'assets/images/pickicon.png',
                  hintText: 'Select Pickup Location',
                ),
                SizedBox(height: 8),
                LocationSearchingWidget(
                  controller: _destinationAddressController,
                  imageAssetPath: 'assets/images/desticon.png',
                  hintText: 'Where to?',
                ),
                SizedBox(height: 16),
                AppButton(
                  label: Text('Done'),
                  icon: Icon(Icons.done),
                  onPressed: () {
                    Address pickup = Address(
                      '1',
                      _pickupAddressController.text,
                      23.1,
                      15.2,
                      _pickupAddressController.text,
                    );
                    Address destination = Address(
                      '2',
                      _destinationAddressController.text,
                      23.1,
                      15.2,
                      _destinationAddressController.text,
                    );
                    addressSearchController.updatePickupAddress(pickup);
                    addressSearchController.updateDestinationAddress(
                      destination,
                    );
                    log(
                      'Address Selected: ${pickup.placeName} - ${destination.placeName}',
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
