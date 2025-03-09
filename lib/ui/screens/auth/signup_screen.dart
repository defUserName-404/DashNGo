import 'package:dash_n_go/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                'Create a Rider\'s Account',
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: 'Full Name')),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 40),
              AppButton(
                label: Text(
                  'SIGN UP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.chevron_right),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'LOG IN',
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
