import 'package:flutter/material.dart';

import 'manage_address.dart';
import 'notifaction_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildHeader(),
            const SizedBox(height: 16),
            _buildMenuItem(Icons.person_outline, 'My Profile'),
            _buildMenuItem(Icons.shopping_bag_outlined, 'Orders'),
            _buildMenuItem(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },

              Icons.notifications_outlined,
              'Notifications',
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '9+',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            _buildMenuItem(Icons.favorite_border, 'Wishlist'),
            _buildMenuItem(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>ManageAddressLayout (),
                  ),
                );
              },
              Icons.location_on_outlined, 'Manage Address'),
            _buildMenuItem(
              Icons.language_outlined,
              'Language',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image.asset(
                  //   'assets/images/uk.png',
                  //   width: 24,
                  //   height: 24,
                  // ),
                  const SizedBox(width: 8),
                  const Text('UK', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            _buildMenuItem(Icons.lock_outline, 'Change Password'),
            _buildMenuItem(Icons.description_outlined, 'Terms & Conditions'),
            _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildMenuItem(Icons.logout, 'Log Out', color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFFDE4B9C), Color(0xFFBC2E94)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage('assets/images/facebook.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Abul Kalam',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '+880 1768 572154',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    Widget? trailing,
    Color color = Colors.black,
    Function()? ontap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: ontap,
    );
  }
}
