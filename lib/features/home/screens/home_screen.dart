import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/quick_booking_card.dart';
import '../widgets/categories_section.dart';
import '../widgets/recently_viewed_card.dart';
import '../widgets/popular_ground_section.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    if (index == 4) {
      // Profile - Navigate to login
      Navigator.pushNamed(context, '/login');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                children: [ // const SİL!
                  const HeaderWidget(),
                  const SizedBox(height: 24),
                  const SearchBarWidget(),
                  const SizedBox(height: 24),
                  const QuickBookingCard(),
                  const SizedBox(height: 24),
                  const CategoriesSection(),
                  const SizedBox(height: 24),
                  const RecentlyViewedCard(), // ƏLAVƏ ET
                  const SizedBox(height: 24),
                  const PopularGroundSection(), // ƏLAVƏ ET
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar( // ƏLAVƏ ET
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}