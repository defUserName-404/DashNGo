import 'package:dash_n_go/services/auth/auth_validator.dart';
import 'package:dash_n_go/services/auth/firebase_auth_service.dart';
import 'package:dash_n_go/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../services/auth/auth_exceptions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                  'Sign In as a Rider',
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium!.fontSize,
                  ),
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
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: AuthValidator.validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 40),
                AppButton(
                  label: Text(
                    'LOG IN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(Icons.chevron_right),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    try {
                      await FirebaseAuthService().signIn(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (context.mounted) {
                        Navigator.popAndPushNamed(context, '/home');
                      }
                    } on UserNotFoundAuthException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('User not found. Please register.'),
                        ),
                      );
                    } on WrongPasswordAuthException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Incorrect password. Please try again.',
                          ),
                        ),
                      );
                    } on GenericAuthException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Authentication failed. Please try again.',
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
      ),
    );
  }
}
