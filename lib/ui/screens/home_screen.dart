import 'dart:async';

import 'package:dash_n_go/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart'
    show Geolocator, LocationAccuracy, LocationSettings, Position;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  final Completer<GoogleMapController> _googleMapControllerCompleter =
      Completer();
  late GoogleMapController _googleMapController;
  late Position _currentPosition;
  String _mapStyle = '';

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void didChangeDependencies() {
    if (Theme.of(context).brightness == Brightness.dark) {
      rootBundle.loadString('assets/maps/maps_style_dark.json').then((string) {
        _mapStyle = string;
      });
    } else {
      rootBundle.loadString('assets/maps/maps_style_light.json').then((string) {
        _mapStyle = string;
      });
    }
    super.didChangeDependencies();
  }

  void setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
    _currentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = CameraPosition(
      target: latLngPosition,
      zoom: 14,
    );
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.colorSecondary),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/user_icon.png',
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New User',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View Profile',
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.labelSmall!.fontSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: const Text('Free Rides'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: const Text('Payments'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: const Text('Rides History'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: const Text('Support'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            style: _mapStyle,
            padding: EdgeInsets.only(top: 590),
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _googleMapControllerCompleter.complete(controller);
              _googleMapController = controller;
              _googleMapController.setMapStyle(_mapStyle);
              setupPositionLocator();
            },
          ),
          Positioned(
            top: 44,
            left: 20,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),
                child: Icon(Icons.menu),
              ),
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        constraints: BoxConstraints(maxHeight: 400, minHeight: 200),
        enableDrag: false,
        builder:
            (context) => SizedBox(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nice to see you',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.labelSmall!.fontSize,
                      ),
                    ),
                    Text(
                      'Where do you want to go?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color:
                              isDark
                                  ? AppColors.colorPrimaryDark
                                  : AppColors.colorPrimary,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color:
                                  isDark
                                      ? AppColors.colorPrimaryDark
                                      : AppColors.colorPrimary,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Search Destination',
                              style: TextStyle(
                                color: AppColors.colorTextSemiLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.home_outlined),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Pickup Location',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              'Your pickup location',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.work_outline_rounded),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Destination Location',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              'Your destination location',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
