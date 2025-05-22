import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Welcome to Ready eCommerce. Get started...',
        'time': 'Now',
        'date': '18 Mar, 2024',
        'isNew': true,
      },
      {
        'title': 'Welcome to Ready eCommerce. Get started explore services',
        'time': '45 minutes ago',
        'date': '18 Mar, 2024',
      },
      {
        'title': 'Welcome to Ready eCommerce. Get started...',
        'time': '10 days ago',
        'date': '18 Mar, 2024',
      },
      {
        'title': 'Welcome to Ready eCommerce. Get started...',
        'time': '1 month ago',
        'date': '18 Mar, 2024',
      },
      {
        'title': 'Welcome to Ready eCommerce. Get started...',
        'time': '23 hours ago',
        'date': '18 Mar, 2024',
        'isNew': true,
      },
      {
        'title': 'Welcome to Ready eCommerce. Get started...',
        'time': '10 days ago',
        'date': '18 Mar, 2024',
      },
      {
        'title': 'Welcome to Ready eCommerce. Get started...',
        'time': '1 month ago',
        'date': '18 Mar, 2024',
      },
      {
        'title': 'Welcome to Ready eCommerce. Get started...',
        'time': '23 hours ago',
        'date': '18 Mar, 2024',
        'isNew': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return _buildNotificationItem(
            title: notif['title']! as String,
            date: notif['date']! as String,
            time: notif['time']! as String,

            isNew: notif['isNew'] == true,
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String date,
    required String time,
    bool isNew = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isNew ? const Color(0xFFFCE5EF) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/png/call.png'),
              ),
              if (isNew)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$date • $time',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
