import 'package:dash_n_go/ui/widgets/location_searching_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Screen')),
      body: SizedBox(
        width: double.infinity,
        height: 150,
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
                  imageAssetPath: 'assets/images/pickicon.png',
                  hintText: 'Select Pickup Location',
                ),
                SizedBox(height: 8),
                LocationSearchingWidget(
                  imageAssetPath: 'assets/images/desticon.png',
                  hintText: 'Where to?',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
