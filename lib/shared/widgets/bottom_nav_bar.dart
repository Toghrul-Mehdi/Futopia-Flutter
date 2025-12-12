// lib/shared/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:futopia_app/features/auth/screens/login_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/event/screens/event_screen.dart';
// digər ekranları da import et

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    Key? key,
    required this.currentIndex, required void Function(int index) onTap,
  }) : super(key: key);

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: Colors.grey[800]!, width: 1)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey[400],
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return; // eyni tabsa heç nə etmə

          switch (index) {
            case 0:
              _navigateTo(context, const HomeScreen());
              break;
            case 1:
              _navigateTo(context, const EventScreen());
              break;
            case 4:
              _navigateTo(context, const LoginScreen());
              break;            
          }
        },
        elevation: 0,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'My booking'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}