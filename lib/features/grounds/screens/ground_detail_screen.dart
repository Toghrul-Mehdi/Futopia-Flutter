import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/ground_type_card.dart';
import '../widgets/facility_item.dart';
import '../widgets/feature_chip.dart';
import 'gallery_screen.dart';

class GroundDetailScreen extends StatefulWidget {
  const GroundDetailScreen({Key? key}) : super(key: key);

  @override
  State<GroundDetailScreen> createState() => _GroundDetailScreenState();
}

class _GroundDetailScreenState extends State<GroundDetailScreen> {
  int _currentImageIndex = 0;
  final List<String> _images = [
    'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=800',
    'https://images.unsplash.com/photo-1551958219-acbc608c6377?w=800',
    'https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?w=800',
  ];

  final List<String> _galleryImages = [
    'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=800',
    'https://images.unsplash.com/photo-1546608235-3310a2494cdf?w=800',
    'https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?w=800',
    'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?w=800',
    'https://images.unsplash.com/photo-1551958219-acbc608c6377?w=800',
    'https://images.unsplash.com/photo-1592656094267-764a45160876?w=800',
    'https://images.unsplash.com/photo-1461876553660-be8c2f316fef?w=800',
    'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=800',
    'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=800',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Image Carousel with Back Button
          Stack(
            children: [
              // Image PageView
              SizedBox(
                height: 300,
                child: PageView.builder(
                  itemCount: _images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      _images[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(Icons.image, color: Colors.grey),
                        );
                      },
                    );
                  },
                ),
              ),

              // Gradient overlay
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),

              // Back Button
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),

              // Image Counter
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_currentImageIndex + 1}/${_images.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category and Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Football',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Text(
                          '\$30',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Location and Rating
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 18, color: AppColors.primary),
                        const SizedBox(width: 4),
                        const Text(
                          'Central park',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.star, size: 18, color: Colors.amber),
                        const SizedBox(width: 4),
                        const Text(
                          '4.2',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Title
                    const Text(
                      'Wonder fun grounds',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Connect with your inner child and revisit emotional moments that still echo in your adult life. This reading is loving, gentle, and nurturing. It helps restore a sense of joy, creativity, and innocence by identifying emotional gaps or abandonment patterns. Ideal for emotional recovery or simply reconnecting with your playful, authentic self.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Ground List
                    const Text(
                      'Ground list',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Expanded(
                          child: GroundTypeCard(
                            imageUrl: 'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=800',
                            title: 'Main',
                            subtitle: 'Mini. 3 hour',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: GroundTypeCard(
                            imageUrl: 'https://images.unsplash.com/photo-1546608235-3310a2494cdf?w=800',
                            title: 'Tenis',
                            subtitle: 'Mini. 1 hour',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Facilities
                    const Text(
                      'Facilities',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          FacilityItem(icon: Icons.local_parking, label: 'Parking'),
                          SizedBox(width: 12),
                          FacilityItem(icon: Icons.camera_alt, label: 'Camera'),
                          SizedBox(width: 12),
                          FacilityItem(icon: Icons.house, label: 'Waiting'),
                          SizedBox(width: 12),
                          FacilityItem(icon: Icons.baby_changing_station, label: 'Changing'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Our Popular Features
                    const Text(
                      'Our popular features',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        FeatureChip(label: 'Hiring partners'),
                        FeatureChip(label: 'Miniature field'),
                        FeatureChip(label: 'Grass pitch'),
                        FeatureChip(label: 'Outdoor /'),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Gallery
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GalleryScreen(images: _galleryImages),
                              ),
                            );
                          },
                          child: const Text(
                            'View all',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(_galleryImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                top: BorderSide(color: Colors.grey[800]!, width: 1),
              ),
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Buy now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}