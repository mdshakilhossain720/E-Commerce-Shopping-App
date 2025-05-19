import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../common/custom_button.dart';
import '../../common/custom_tetx_field.dart';
import '../../config/app_tetx_style.dart';



class RecoverPasswordLayout extends StatefulWidget {
  final bool isPasswordRecover;
  const RecoverPasswordLayout({super.key, required this.isPasswordRecover});

  @override
  State<RecoverPasswordLayout> createState() => _RecoverPasswordLayoutState();
}

class _RecoverPasswordLayoutState extends State<RecoverPasswordLayout> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: FormBuilder(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // AnimatedImage(
                        //   imageSize: 100.w,
                        //   imageWidget: SvgPicture.asset(
                        //     Assets.svg.recoverpPassword,
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                        Gap(30.h),
                        Text(
                          widget.isPasswordRecover
                              ? 'reset password'
                              : 'Verify Phone Number',
                          style: AppTextStyle(context)
                              .title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Gap(16.h),
                        Text(
                          widget.isPasswordRecover
                              ? 'reset password'
                              : 'verify phone number',
                          textAlign: TextAlign.center,
                          style: AppTextStyle(context).bodyText.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Gap(40.h),
                        CustomTextFormField(
                          name: 'phone',
                          hintText: 'phone number',
                          textInputType: TextInputType.phone,
                          controller: phoneController,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        Gap(30.h),
                        CustomButton(
                          buttonText: 'send otp',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // Placeholder action for OTP
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'OTP sent to ${phoneController.text}'),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 26.h,
              left: 16.w,
              child: IconButton(
                onPressed: () {
                  //context.nav.pop();
                },
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
