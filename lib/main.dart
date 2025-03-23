import 'package:dash_n_go/features/auth/ui/auth_wrapper.dart';
import 'package:dash_n_go/features/auth/ui/screens/login_screen.dart';
import 'package:dash_n_go/features/auth/ui/screens/signup_screen.dart';
import 'package:dash_n_go/features/home/ui/screens/home_screen.dart';
import 'package:dash_n_go/util/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/address_search/ui/screens/address_search_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthWrapper(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/addressSearchScreen': (context) => AddressSearchScreen(),
      },
    );
  }
}
