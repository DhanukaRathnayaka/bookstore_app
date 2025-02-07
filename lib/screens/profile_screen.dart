import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0, // Remove app bar shadow
        backgroundColor: Colors.blue[700], // Blue app bar
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        // For scrollability if content overflows
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: const AssetImage('assets/Dhanuka.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dhanuka Rathnayaka',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('dhanukarathnayaka658@gmail.com'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Reusable list tile function
              _buildListTile('Orders', Icons.shopping_cart_outlined),
              _buildListTile('My Details', Icons.person_outline),
              _buildListTile('Delivery Address', Icons.local_shipping_outlined),
              _buildListTile('Payment Methods', Icons.payment_outlined),
              _buildListTile('Promo Cord', Icons.discount_outlined),
              _buildListTile('Notifications', Icons.notifications_outlined),
              _buildListTile('Help', Icons.help_outline),
              _buildListTile('About', Icons.info_outline),

              const SizedBox(height: 24),

              Center(
                // Center the Log Out button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle logout logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 247, 80, 80), // Light gray background
                    foregroundColor: const Color.fromARGB(
                        255, 246, 245, 245), // Black text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Log Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a ListTile with icon and arrow
  Widget _buildListTile(String title, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Handle navigation or action for this item
          },
        ),
        const Divider(
            height: 1, color: Colors.grey), // Add a divider below each item
      ],
    );
  }
}
