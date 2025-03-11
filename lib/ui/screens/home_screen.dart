import 'package:dash_n_go/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng? _currentPosition;
  final MapController _mapController = MapController();
  final bool _isMapReady = false; // Add this flag
  // late final AnimationController  _bottomSheetAnimationController;
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    // _bottomSheetAnimationController = AnimationController(vsync: ,
    //   duration: Duration(milliseconds: 200),
    // );
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
        });

        if (_isMapReady && _currentPosition != null) {
          _mapController.move(_currentPosition!, 15);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error getting location: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text('Map View'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.my_location),
      //       onPressed: () {
      //         if (_isMapReady && _currentPosition != null) {
      //           _mapController.move(_currentPosition!, 15);
      //         }
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.logout),
      //       onPressed: () async {
      //         await FirebaseAuthService().signOut();
      //         Navigator.pushReplacementNamed(context, '/');
      //       },
      //     ),
      //   ],
      // ),
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
          Container(color: Colors.greenAccent),
          Positioned(
            top: 44,
            left: 20,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
      // _currentPosition == null
      //     ? Center(child: CircularProgressIndicator())
      //     : FlutterMap(
      //       mapController: _mapController,
      //       options: MapOptions(
      //         initialCenter: _currentPosition!,
      //         initialZoom: 15,
      //         onMapReady: () {
      //           // Set the flag when map is ready
      //           setState(() {
      //             _isMapReady = true;
      //           });
      //           _mapController.move(_currentPosition!, 15);
      //         },
      //       ),
      //       children: [
      //         TileLayer(
      //           urlTemplate:
      //               'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      //           userAgentPackageName: 'com.defusername.dash_n_go',
      //         ),
      //         MarkerLayer(
      //           markers: [
      //             Marker(
      //               width: 80.0,
      //               height: 80.0,
      //               point: _currentPosition!,
      //               child: Icon(
      //                 Icons.location_pin,
      //                 color: Colors.red,
      //                 size: 40,
      //               ),
      //             ),
      //           ],
      //         ),
      //         RichAttributionWidget(
      //           attributions: [
      //             TextSourceAttribution(
      //               'OpenStreetMap contributors',
      //               onTap: () async {
      //                 final url = Uri.parse(
      //                   'https://openstreetmap.org/copyright',
      //                 );
      //                 if (await canLaunchUrl(url)) {
      //                   await launchUrl(url);
      //                 } else {
      //                   if (mounted) {
      //                     ScaffoldMessenger.of(context).showSnackBar(
      //                       SnackBar(content: Text('Could not launch URL')),
      //                     );
      //                   }
      //                 }
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
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
                    SearchBar(
                      constraints: BoxConstraints(maxHeight: 40, minHeight: 40),
                      leading: Icon(Icons.search),
                      hintText: 'Search Destination',
                      elevation: WidgetStatePropertyAll<double>(0),
                      side: WidgetStatePropertyAll<BorderSide>(
                        BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.colorPrimary
                                  : AppColors.colorPrimaryDark,
                        ),
                      ),
                      shape: WidgetStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
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
