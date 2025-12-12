import 'package:flutter/material.dart';
import 'package:futopia_app/features/event/screens/event_detail_screen.dart';
import 'package:futopia_app/features/event/screens/event_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/booking/screens/my_booking_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String events = '/events';
  static const String eventDetail = '/event-detail';
  static const String myBooking = '/my-booking';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case events:
        return MaterialPageRoute(builder: (_) => const EventScreen());
      case eventDetail:
        return MaterialPageRoute(builder: (_) => const EventDetailScreen());
      case myBooking:
        return MaterialPageRoute(builder: (_) => const MyBookingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}