import 'package:dash_n_go/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _nameController,
      _emailController,
      _phoneNumberController,
      _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) {
                    debugPrint("Image failed to load: $error");
                    return const Text('Image not found');
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sign In as a Rider',
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 40),
              AppButton(
                label: Text(
                  'LOG IN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.chevron_right),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('instead'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
