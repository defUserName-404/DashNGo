import 'package:dash_n_go/services/auth/firebase_auth_service.dart';
import 'package:dash_n_go/ui/screens/auth/login_screen.dart';
import 'package:dash_n_go/ui/screens/auth/signup_screen.dart';
import 'package:dash_n_go/ui/screens/home_screen.dart';
import 'package:dash_n_go/ui/theme/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAuthService().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
