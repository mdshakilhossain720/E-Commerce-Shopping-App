import 'package:ecommerceshoppingapp/common/custom_transfer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme.dart';
import '../../utilis/global_function.dart';
import '../../widgets/address_card.dart';
import 'add_address.dart';

class ManageAddressLayout extends StatefulWidget {
  const ManageAddressLayout({super.key});

  @override
  State<ManageAddressLayout> createState() => _ManageAddressLayoutState();
}

class _ManageAddressLayoutState extends State<ManageAddressLayout> {
  final List<AddAddress> mockAddresses = [
    AddAddress(
      id: 1,
      title: 'Home',
      addressLine1: '123 Main Street',
      city: 'New York',
      postalCode: '10001',
    ),
    AddAddress(
      id: 2,
      title: 'Work',
      addressLine1: '456 Business Blvd',
      city: 'Los Angeles',
      postalCode: '90001',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors(context).accentColor,
      appBar: AppBar(
        title: Text('Manage Address'),
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      bottomNavigationBar: _buildBottomNavigationWidget(context: context),
      body: Column(
        children: [
          Divider(thickness: 10, color: colors(context).accentColor),
          Expanded(
            child: mockAddresses.isEmpty
                ? const Center(child: Text('No addresses found'))
                : ListView.builder(
                    itemCount: mockAddresses.length,
                    itemBuilder: (context, index) {
                      final address = mockAddresses[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                        child: AddressCard(
                          cardColor: GlobalFunction.getContainerColor(),
                          showEditButton: true,
                          onTap: () {},
                          editTap: () {
                            
                            
                          },
                          address: address, appLocal: '',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationWidget({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14),
      height: 86.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: GlobalFunction.getContainerColor(),
            width: 2.0,
          ),
        ),
      ),
      child: CustomTransparentButton(
        buttonText: 'Add Address',
        onTap: () {
         
        },
        borderColor: colors(context).primaryColor,
        buttonTextColor: colors(context).primaryColor,
      ),
    );
  }
}
