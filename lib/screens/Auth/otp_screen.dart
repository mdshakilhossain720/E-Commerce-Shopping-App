import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../common/custom_button.dart';
import '../../config/app_tetx_style.dart';
import '../../config/theme.dart';
import 'widgets/pinput.dart';

class ConfirmOTPLayout extends StatefulWidget {
  final ConfirmOTPScreenArguments arguments;
  const ConfirmOTPLayout({super.key, required this.arguments});

  @override
  State<ConfirmOTPLayout> createState() => _ConfirmOTPLayoutState();
}

class _ConfirmOTPLayoutState extends State<ConfirmOTPLayout> {
  final TextEditingController pinCodeController = TextEditingController();

  Timer? timer;
  int start = 60;
  bool isComplete = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    pinCodeController.addListener(pinCodeListener);
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        timer.cancel();
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void pinCodeListener() {
    setState(() {
      isComplete = pinCodeController.text.length == 4;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pinCodeController.removeListener(pinCodeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AnimatedImage(
                  //   imageSize: 100.w,
                  //   imageWidget: Assets.png.confirmOtp.image(),
                  // ),
                  Gap(20.h),
                  Text(
                    'Enter OTP',
                    style: AppTextStyle(context)
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Gap(20.h),
                  Column(
                    children: [
                      Text('We sent an OTP to your phone'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.arguments.phoneNumber,
                            style: AppTextStyle(context).bodyText.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: colors(context).primaryColor,
                                ),
                          ),
                          Gap(5.w),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            //child: SvgPicture.asset(Assets.svg.edit),
                          )
                        ],
                      )
                    ],
                  ),
                  Gap(40.h),
                  PinPutWidget(
                    pinCodeController: pinCodeController,
                    onCompleted: (pin) {},
                    validator: (value) => null,
                  ),
                  Gap(30.h),
                  AbsorbPointer(
                    absorbing: !isComplete,
                    child: CustomButton(
                      buttonText: 'Confirm OTP',
                      buttonColor: isComplete
                          ? colors(context).primaryColor
                          : colors(context).primaryColor!.withOpacity(0.4),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('OTP Verified (Mocked)')),
                        );
                        // Example navigation
                       //Navigator.pushNamed(context, Routes.home);
                      },
                    ),
                  ),
                  Gap(30.h),
                  Text(
                    "Resend Code in 00:$start sec",
                    style: AppTextStyle(context).bodyText.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  if (start == 0)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          start = 60;
                        });
                        startTimer();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('OTP Resent (Mocked)')),
                        );
                      },
                      child: Text(
                        'Resend',
                        style: AppTextStyle(context)
                            .bodyTextSmall
                            .copyWith(color: colors(context).primaryColor),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmOTPScreenArguments {
  final String phoneNumber;
  final bool isPasswordRecover;
  final bool? isFromCheckoutScreen;

  ConfirmOTPScreenArguments({
    required this.phoneNumber,
    required this.isPasswordRecover,
    this.isFromCheckoutScreen,
  });
}
