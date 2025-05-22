import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddress {
  final int id;
  final String title;
  final String addressLine1;
  final String city;
  final String postalCode;

  AddAddress({
    required this.id,
    required this.title,
    required this.addressLine1,
    required this.city,
    required this.postalCode,
  });
}

class ManageAddressScreen extends StatelessWidget {
  ManageAddressScreen({super.key});

  final List<AddAddress> addresses = [
    AddAddress(
      id: 1,
      title: 'Home',
      addressLine1: '123 Main St',
      city: 'New York',
      postalCode: '10001',
    ),
    AddAddress(
      id: 2,
      title: 'Office',
      addressLine1: '456 Business Rd',
      city: 'New York',
      postalCode: '10002',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Address')),
      body: Column(
        children: [
          Divider(thickness: 10, color: Colors.grey.shade300),
          Expanded(
            child:
                addresses.isEmpty
                    ? Center(child: Text('No addresses found.'))
                    : ListView.builder(
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        final address = addresses[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              title: Text(address.title),
                              subtitle: Text(
                                '${address.addressLine1}, ${address.city}, ${address.postalCode}',
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  // Handle edit address tap here
                                },
                              ),
                              onTap: () {
                                // Handle address tap here
                              },
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        height: 80.h,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Add Address screen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('Add New Address'),
        ),
      ),
    );
  }
}
