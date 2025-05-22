import 'package:ecommerceshoppingapp/screens/profile_page/add_address.dart' show AddAddress;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gap/gap.dart';

import '../config/app_color.dart';
import '../config/app_tetx_style.dart';
import '../config/theme.dart';


class AddressCard extends StatelessWidget {
  final AddAddress? address;
  final bool showEditButton;
  final void Function()? onTap;
  final void Function()? editTap;
  final Color? cardColor;
  final Color? borderColor;
  final String appLocal; // <-- Locale passed from API or controller

  const AddressCard({
    super.key,
    required this.address,
    this.showEditButton = false,
    this.onTap,
    this.editTap,
    this.cardColor,
    this.borderColor,
    required this.appLocal,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10.r),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h).copyWith(
              left: 40.w,
              right: appLocal == 'ar' ? 40.w : null,
            ),
            decoration: ShapeDecoration(
              color: cardColor ?? colors(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(
                  color: borderColor ?? colors(context).accentColor!,
                ),
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAddressTagCard(context),
                Gap(10.h),
                _buildAddressInfoWidget(context),
              ],
            ),
          ),
        ),
        if (showEditButton)
          Positioned(
            right: appLocal == 'ar' ? null : 14.w,
            top: 12.h,
            left: appLocal == 'ar' ? 14.w : null,
            child: _buildEditButton(context),
          ),
        Positioned(
          top: 16.h,
          left: appLocal == 'ar' ? null : 14.w,
          right: appLocal == 'ar' ? 16.w : null,
          child: SvgPicture.asset(
            'assets/svg/location_purple.svg',
            colorFilter: ColorFilter.mode(
              colors(context).primaryColor!,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressTagCard(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          decoration: ShapeDecoration(
            color: EcommerceAppColor.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          child: Text(
            'home',
            style: AppTextStyle(context)
                .bodyTextSmall
                .copyWith(color: EcommerceAppColor.white, fontSize: 13.sp),
          ),
        ),
        //if (address!.isDefault) ...[
          Gap(8.w),
          Text(
            'is default',
            style: AppTextStyle(context).bodyTextSmall.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
          )
        ]
      //],
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: editTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
            side: BorderSide(color: EcommerceAppColor.primary),
          ),
        ),
        child: Center(
          child: Text(
           'Edit',
            style: AppTextStyle(context)
                .bodyText
                .copyWith(color: EcommerceAppColor.primary, fontSize: 12.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressInfoWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'name',
          style: AppTextStyle(context).bodyTextSmall.copyWith(fontSize: 12.sp),
        ),
        Gap(5.h),
        Text(
          'phone',
          style: AppTextStyle(context).bodyTextSmall.copyWith(fontSize: 12.sp),
        ),
        Gap(5.h),
        Text(
          'address',
          style: AppTextStyle(context).bodyTextSmall.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
