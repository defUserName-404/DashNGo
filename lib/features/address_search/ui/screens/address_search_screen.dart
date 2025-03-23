import 'dart:developer';

import 'package:dash_n_go/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Search Screen')),
      body: SizedBox(
        width: double.infinity,
        height: 210,
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
                  imageAssetPath: 'assets/images/desticon.png',
                  hintText: 'Where to?',
                ),
                SizedBox(height: 16),
                AppButton(
                  label: Text('Done'),
                  icon: Icon(Icons.done),
                  onPressed: () {
                    log(
                      'Address ${_pickupAddressController.text} - ${_destinationAddressController.text}',
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
