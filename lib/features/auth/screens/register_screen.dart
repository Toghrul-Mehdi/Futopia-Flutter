// lib/features/auth/screens/register_screen.dart

import 'package:flutter/material.dart';
import 'package:futopia_app/features/auth/screens/login_screen.dart';
import '../../../core/constants/app_colors.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/or_divider.dart';
import '../widgets/skip_button.dart';
import '../widgets/social_login_button.dart';
import '../widgets/auth_footer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;

  final _firstNameController = TextEditingController(text: 'Dev');
  final _lastNameController = TextEditingController(text: 'Cooper');
  final _usernameController = TextEditingController(text: 'devcooper');
  final _emailController = TextEditingController(text: 'devcooper@gmail.com');
  final _passwordController = TextEditingController(text: '123456');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background, AppColors.backgroundDark],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SkipButton(), // sağ üst
                  const SizedBox(height: 40),

                  const AuthHeader(
                    title: 'Sign up',
                    subtitle: 'Sign in and start planning your next playground visit',
                  ),
                  const SizedBox(height: 40),

                  // First Name
                  AuthTextField(
                    label: 'First name',
                    hintText: 'Enter your first name',
                    controller: _firstNameController,
                  ),
                  const SizedBox(height: 20),

                  // Last Name
                  AuthTextField(
                    label: 'Last name',
                    hintText: 'Enter your last name',
                    controller: _lastNameController,
                  ),
                  const SizedBox(height: 20),

                  // Username
                  AuthTextField(
                    label: 'Username',
                    hintText: 'Choose a username',
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 20),

                  // Email
                  AuthTextField(
                    label: 'Email address',
                    hintText: 'Enter your email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),

                  // Password
                  AuthTextField(
                    label: 'Password',
                    hintText: 'Create a strong password',
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Sign Up Button (yaşıl rəngli)
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // sənin dizaynda yaşıl idi
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  const OrDivider(),
                  const SizedBox(height: 32),

                  // Google
                  SocialLoginButton(
                    icon: Image.network(
                      'https://www.google.com/favicon.ico',
                      width: 24,
                      height: 24,
                    ),
                    label: 'Continue with Google',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),

                  // Apple
                  SocialLoginButton(
                    icon: const Icon(Icons.apple, color: Colors.white, size: 28),
                    label: 'Continue with Apple',
                    onPressed: () {},
                  ),

                                    const SizedBox(height: 40),

                  AuthFooter(
                    text: "Already have an account?",
                    buttonText: "Sign in",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}