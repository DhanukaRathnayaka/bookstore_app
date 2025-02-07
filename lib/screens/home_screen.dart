import 'package:flutter/material.dart';

void main() {
  runApp(const BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  const BookstoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[700],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBookItem(
              context: context,
              image: 'assets/book1.jpg',
              title: 'The Twilight Saga: New Moon',
              author: 'Stephenie Meyer',
              price: '\Rs 1500',
              details: "On Bella Swan's eighteenth birthday, Edward Cullen, the vampire she loves, and his family throw her a birthday party at their residence. While unwrapping a gift, Bella receives a paper cut. Edward's adopted brother, Jasper, is overwhelmed by the scent of her blood and attempts to attack her.",
            ),
            _buildBookItem(
              context: context,
              image: 'assets/book2.jpg',
              title: 'The Twilight Saga: Breaking Dawn',
              author: 'Stephenie Meyer',
              price: '\Rs 1500',
              details: "The breathtaking conclusion to The Twilight Saga follows Bella Swan "
        "as she faces love, sacrifice, and the ultimate battle between vampires, werewolves, "
        "and humans. After marrying Edward Cullen, Bella becomes pregnant with a mysterious child, "
        "triggering an intense conflict that could change everything. As the powerful Volturi prepare "
        "to intervene, Bella must find the strength to protect those she loves.",
            ),
            _buildBookItem(
              context: context,
              image: 'assets/book3.jpg',
              title: 'Vampire Blood Royals',
              author: 'Sabrina C. Rose', // Add author
              price: '\Rs 1500',
              details: "While specific plot details for Love Mark are currently limited, the Vampire Blood Royals series is renowned for its blend of steamy romance, intricate vampire politics, and suspenseful narratives. The series delves into the lives of vampire royalty, exploring their complex relationships, power struggles, and the challenges they face in a world where the supernatural and human realms intertwine.In the previous installments, readers were introduced to a world where vampire princes navigate love, loyalty, and danger. Love Mark is anticipated to continue this tradition, offering a captivating story that delves deeper into the vampire royals' universe.",
            ),
            _buildBookItem(
              context: context,
              image: 'assets/book4.jpg',
              title: 'Harry Potter and the Sorcerer’s Stone',
              author: ' J.K. Rowling', // Add author
              price: '\Rs 1500',
              details: 'Harry Potter and the Sorcerer’s Stone follows Harry Potter, an 11-year-old orphan who discovers he is a wizard and has been accepted to Hogwarts School of Witchcraft and Wizardry. Raised by his neglectful aunt and uncle, Harry learns that he is famous in the wizarding world for surviving an attack by the dark wizard Lord Voldemort, who killed his parents but mysteriously failed to kill him . At Hogwarts, Harry befriends Ron Weasley and Hermione Granger, learns to play Quidditch, and begins to uncover the mysteries of the Sorcerer’s Stone—a legendary object that grants immortality. He also encounters Professor Snape, Draco Malfoy, and the gentle giant Hagrid, who helps him navigate his new world . As Harry and his friends investigate, they discover that someone is trying to steal the Sorcerer’s Stone, hidden deep within Hogwarts. Their journey leads them to a confrontation with Professor Quirrell, who is secretly possessed by Voldemort. In a thrilling climax, Harry prevents Voldemort from returning to power, protecting the stone from falling into the wrong hands.',
            ),
            _buildBookItem(
              context: context,
              image: 'assets/book5.jpg',
              title: 'The Lord of the Rings',
              author: 'J.R.R. Tolkien', // Add author
              price: '\Rs 1500',
              details: 'The Lord of the Rings is a legendary fantasy epic set in Middle-earth, a world of elves, dwarves, humans, hobbits, and dark forces. The story follows Frodo Baggins, a young hobbit who inherits the One Ring, a powerful artifact created by the dark lord Sauron. To prevent Sauron from reclaiming the Ring and conquering Middle-earth, Frodo embarks on a perilous journey to destroy it in the fires of Mount Doom.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookItem({
    required BuildContext context,
    required String image,
    required String title,
    required String author,
    required String price,
    required String details,
  }) {
    return GestureDetector(
      onTap: () {
        _showBookDetailsBottomSheet(context, image, title, author, details);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Author
              Text(
                "By $author",
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Cover Photo
              Center(
                child: Image.asset(
                  image,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),

              // Price and Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Center-align the row horizontally
                children: [
                  // Price Text
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16), // Gap between price and button

                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      print("Added $title to cart!");
                    },
                    child: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBookDetailsBottomSheet(BuildContext context, String image,
      String title, String author, String details) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        image,
                        width: 200,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "By $author",
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      details,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print("Added $title to cart!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Add to Cart'),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
