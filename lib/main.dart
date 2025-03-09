import 'package:dash_n_go/ui/screens/auth/login_screen.dart';
import 'package:dash_n_go/ui/screens/auth/signup_screen.dart';
import 'package:dash_n_go/ui/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
