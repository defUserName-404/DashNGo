import 'package:dash_n_go/services/auth/auth_validator.dart';
import 'package:dash_n_go/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../services/auth/auth_exceptions.dart';
import '../../../services/auth/firebase_auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator: AuthValidator.validateName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: AuthValidator.validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: AuthValidator.validatePhone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: AuthValidator.validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 40),
                AppButton(
                  label: Text(
                    'SIGN UP',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(Icons.person_add),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    try {
                      await FirebaseAuthService().register(
                        email: _emailController.text,
                        password: _passwordController.text,
                        fullName: _nameController.text,
                        phoneNumber: _phoneNumberController.text,
                      );
                      if (context.mounted) {
                        Navigator.popAndPushNamed(context, '/home');
                      }
                    } on WeakPasswordAuthException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Password is too weak. Use at least 6 characters.',
                          ),
                        ),
                      );
                    } on EmailAlreadyExistsException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Email already registered. Try logging in.',
                          ),
                        ),
                      );
                    } on InvalidEmailAuthException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid email format.')),
                      );
                    } on GenericAuthException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Registration failed. Please try again.',
                          ),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('An unexpected error occurred.'),
                        ),
                      );
                    }
                  },
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
      ),
    );
  }
}
