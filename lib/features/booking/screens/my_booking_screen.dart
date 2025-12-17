import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../widgets/booking_card.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 3; // My booking seçilib

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          child: Column(
            children: [
              // Header
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
                child: Text(
                  'My booking',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Tab Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1a1f2e),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[400],
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancelled'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildUpcomingTab(),
                    _buildCompletedTab(),
                    _buildCancelledTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar - ƏLAVƏ EDİLDİ!
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildUpcomingTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: const [
        BookingCard(
          bookingId: '#5049',
          groundName: 'Wonder fun grounds',
          imageUrl: 'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=800',
          date: 'Dec 12, 2025',
          time: '03:00 pm -',
          price: '\$30',
          status: BookingStatus.upcoming,
        ),
        SizedBox(height: 16),
        BookingCard(
          bookingId: '#8453',
          groundName: 'Net masters ground',
          imageUrl: 'https://images.unsplash.com/photo-1551958219-acbc608c6377?w=800',
          date: 'Dec 12, 2025',
          time: '09:00 am -',
          price: '\$30',
          status: BookingStatus.upcoming,
        ),
        SizedBox(height: 100), // Bottom nav üçün boşluq
      ],
    );
  }

  Widget _buildCompletedTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: const [
        BookingCard(
          bookingId: '#5049',
          groundName: 'Wonder fun grounds',
          imageUrl: 'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=800',
          date: 'Dec 12, 2025',
          time: '03:00 pm -',
          price: '\$30',
          status: BookingStatus.completed,
        ),
        SizedBox(height: 16),
        BookingCard(
          bookingId: '#8453',
          groundName: 'Net masters ground',
          imageUrl: 'https://images.unsplash.com/photo-1551958219-acbc608c6377?w=800',
          date: 'Dec 12, 2025',
          time: '09:00 am -',
          price: '\$30',
          status: BookingStatus.completed,
        ),
        SizedBox(height: 100), // Bottom nav üçün boşluq
      ],
    );
  }

  Widget _buildCancelledTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel_outlined,
            size: 80,
            color: Colors.grey[700],
          ),
          const SizedBox(height: 16),
          Text(
            'No cancelled bookings',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}