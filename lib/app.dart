import 'package:flutter/material.dart';
import 'features/auth/screens/login_screen.dart';
import 'core/routes/app_routes.dart';
class SportsBookingApp extends StatelessWidget {
  const SportsBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futopia',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1a1f2e),
        primaryColor: const Color(0xFF22c55e),
      ),
      home: const LoginScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}