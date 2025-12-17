import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> images;

  const GalleryScreen({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Gallery',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Şəkli tam ekranda göstərmək üçün
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Center(
                        child: InteractiveViewer(
                          child: Image.network(
                            images[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 20,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.white, size: 30),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}