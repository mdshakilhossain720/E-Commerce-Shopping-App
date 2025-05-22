import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/custom_button.dart';
import '../../common/custom_tetx_field.dart';
import '../../config/app_tetx_style.dart';


class SupportLayout extends StatelessWidget {
  const SupportLayout({super.key});

  static TextEditingController subjectController = TextEditingController();
  static TextEditingController messageController = TextEditingController();
  static List<FocusNode> fList = [FocusNode(), FocusNode()];
  static final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Get Support'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Support',
                  style: AppTextStyle(context)
                      .title
                      .copyWith(fontSize: 28.sp, fontWeight: FontWeight.w700),
                ),
                Gap(8.h),
                Text(
                  'We are here to help you',
                  style: AppTextStyle(context).bodyText.copyWith(fontSize: 14.sp),
                ),
                Gap(24.h),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        name: 'subject',
                        textInputType: TextInputType.text,
                        focusNode: fList[0],
                        controller: subjectController,
                        textInputAction: TextInputAction.next,
                        validator: (value) => null,
                        hintText: 'Subject',
                      ),
                      Gap(20.h),
                      CustomTextFormField(
                        name: 'message',
                        textInputType: TextInputType.multiline,
                        focusNode: fList[1],
                        minLines: 4,
                        maxLines: 4,
                        controller: messageController,
                        textInputAction: TextInputAction.newline,
                        validator: (value) => null,
                        hintText: 'Message',
                      ),
                      Gap(20.h),
                      CustomButton(
                        buttonText: 'Send',
                        onPressed: () {
                          // Just reset form locally
                          subjectController.clear();
                          messageController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Message sent locally")),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Gap(36.h),
                Divider(thickness: 0.5),
                Center(
                  child: Text(
                    'Contact Us',
                    style: AppTextStyle(context).bodyText.copyWith(
                        fontSize: 12.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse("tel://+1234567890")),
                      child: Image.asset(
                        'assets/png/phone.png',),
                    ),
                    Gap(28.w),
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse("https://m.me/yourpage")),
                      child: Image.asset(
                        'assets/png/facebook.png',
                      )
                    ),
                    Gap(28.w),
                    GestureDetector(
                      onTap: () => _whatsAppService(
                        phoneNumber: "+1234567890",
                        message: "Hello Support",
                      ),
                      child: Image.asset(
                        'assets/png/whatsapp.png',
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _whatsAppService({
    required String phoneNumber,
    required String message,
  }) async {
    final encodedPhoneNumber = Uri.encodeComponent(phoneNumber);
    final encodedMessage = Uri.encodeComponent(message);
    final whatsappUrl =
        "whatsapp://send?phone=$encodedPhoneNumber&text=$encodedMessage";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}
