import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/custom_transfer_button.dart';
import '../../config/theme.dart';
import '../../utilis/global_function.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = [
      {
        'type': 'HOME',
        'isDefault': false,
        'name': 'Jahidul Islam',
        'phone': '+880 1768 572 658',
        'address': 'Sekhertek, 52/A, Adabor, Mohammadpur-1207',
      },
      {
        'type': 'OFFICE',
        'isDefault': true,
        'name': 'Jahidul Islam',
        'phone': '+880 1768 572 658',
        'address': 'Sekhertek, 52/A, Adabor, Mohammadpur-1207',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Address"),
        leading: const BackButton(),
      ),
       bottomNavigationBar: _buildBottomNavigationWidget(context: context),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final item = addresses[index];
          return AddressCard(
            type: item['type'] as String,
            isDefault: item['isDefault'] as bool,
            name: item['name'] as String,
            phone: item['phone'] as String,
            address: item['address'] as String,
          );
        },
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String type;
  final bool isDefault;
  final String name;
  final String phone;
  final String address;

  const AddressCard({
    super.key,
    required this.type,
    required this.isDefault,
    required this.name,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_pin, color: Colors.pink),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isDefault) ...[
                  const SizedBox(width: 8),
                  const Text(
                    'Default Address',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
                const Spacer(),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.pink,
                    side: const BorderSide(color: Colors.pink),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {},
                  child: const Text("Edit"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(phone),
            const SizedBox(height: 4),
            Text(address),
          ],
        ),
      ),
    );
  }
}



  Widget _buildBottomNavigationWidget({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14),
      height: 86.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
        ),
      ),
      child: CustomTransparentButton(
        buttonText: 'Add New Address',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ManageAddressScreen(),
            ),
          );
        },
        borderColor: colors(context).primaryColor,
        buttonTextColor: colors(context).primaryColor,
      ),
    );
  }

