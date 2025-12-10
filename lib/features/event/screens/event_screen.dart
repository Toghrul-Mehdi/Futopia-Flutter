// lib/features/event/screens/event_screen.dart

import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../widgets/event_card.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _selectedIndex = 1; // Events seçilib

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Digər tablara keçid üçün Navigator istifadə edə bilərsən
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
              // Başlıq
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
                child: Text(
                  'Event',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Kartlar siyahısı
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: const [
                    EventCard(
                      imageUrl: 'https://images.unsplash.com/photo-1511886929837-354d827aae26?w=800',
                      title: 'Football fiesta 2025',
                      date: '22 Aug 2025',
                    ),
                    EventCard(
                      imageUrl: 'https://images.unsplash.com/photo-1595433805517-995f2c0f6334?w=800',
                      title: 'Summer sports carnival',
                      date: '10 Sep 2025',
                    ),
                    EventCard(
                      imageUrl: 'https://images.unsplash.com/photo-1517649763962-0c623066013b?w=800',
                      title: 'Wonder cup tournament',
                      date: '18 Nov 2025',
                    ),
                    SizedBox(height: 100), // Bottom nav üçün boşluq
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
} 