import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // Sample favorite items (replace with your actual favorite data)
  List<FavoriteItem> favoriteItems = [
    FavoriteItem(
      image: 'assets/book1.jpg',
      title: 'Book Title 1',
      author: 'Author 1',
    ),
    FavoriteItem(
      image: 'assets/book3.jpg',
      title: 'Book Title 3',
      author: 'Author 3',
    ),
    // Add more favorite items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[700],
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                'You have no favorite books yet.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder( // Use GridView for better layout
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  childAspectRatio: 0.6, // Adjust aspect ratio for better card proportions
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  return _buildFavoriteItem(favoriteItems[index]);
                },
              ),
            ),
    );
  }

  Widget _buildFavoriteItem(FavoriteItem item) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell( // Make card tappable
        onTap: () {
          // Handle tap on favorite item (e.g., navigate to details screen)
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    item.author,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteItem {
  String image;
  String title;
  String author;

  FavoriteItem({
    required this.image,
    required this.title,
    required this.author,
  });
}