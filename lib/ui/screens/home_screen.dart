import 'package:dash_n_go/services/auth/firebase_auth_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref("messages");
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];
  final String maptilerApiKey = '38KhmdRGU84H8kBiHy8u';

  @override
  void initState() {
    super.initState();
    _database.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      setState(() {
        messages = data.values.map((value) => value.toString()).toList();
      });
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _database.push().set(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapTiler Map'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuthService().signOut();
              if (context.mounted) Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          // initialCenter: LatLng(51.5, -0.09), // Set your desired center coordinates
          // zoom: 13.0,
        ),
        children: [
          TileLayer(
            // MapTiler basic map style URL template
            urlTemplate:
                "https://api.maptiler.com/maps/basic-v2/style.json?key=38KhmdRGU84H8kBiHy8u",
            additionalOptions: {
              'accessToken': maptilerApiKey,
              'id': 'maptiler.basic',
            },
          ),
        ],
      ),
    );
  }
}
