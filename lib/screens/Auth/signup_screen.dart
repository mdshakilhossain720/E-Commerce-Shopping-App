import 'package:ecommerceshoppingapp/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../common/custom_button.dart';
import '../../common/custom_tetx_field.dart';
import '../../config/app_tetx_style.dart';
import '../../config/theme.dart';
import '../../utilis/global_function.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({super.key});

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final List<FocusNode> fNodes = List.generate(5, (_) => FocusNode());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final List<String> staticCountries = [
  'Bangladesh',
  'India',
  'United States',
  'Canada',
  'United Kingdom',
];

String? selectedCountry;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                buildBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w)
          .copyWith(bottom: 20.h, top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create Account',
            style: AppTextStyle(context)
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Gap(20.h),

          /// Full Name
          CustomTextFormField(
            name: 'name',
            hintText: 'Full Name',
            controller: nameController,
            textInputType: TextInputType.name,
            focusNode: fNodes[0],
            textInputAction: TextInputAction.next,
            validator: (value) => GlobalFunction.commonValidator(
              value: value!,
              hintText: 'Full Name',
              context: context,
            ),
          ),
          Gap(20.h),

          /// Phone or Email
          CustomTextFormField(
            name: 'emailphone',
            hintText: 'Email or Phone',
            controller: phoneController,
            textInputType: TextInputType.text,
            focusNode: fNodes[1],
            textInputAction: TextInputAction.next,
            validator: (value) => GlobalFunction.commonValidator(
              value: value!,
              hintText: 'Email or Phone',
              context: context,
            ),
          ),
          Gap(20.h),


FormBuilderDropdown<String>(
  name: 'country',
  hint: Text('Select Country'),
  validator: (value) {
    if (value == null) {
      return 'Please select a country';
    }
    return null;
  },
  onChanged: (value) {
    setState(() {
      selectedCountry = value;
      // You can update `countryCode` manually based on selectedCountry if needed
    });
    debugPrint("Selected country: $selectedCountry");
  },
  items: staticCountries.map((country) {
    return DropdownMenuItem(
      value: country,
      child: Text(country),
    );
  }).toList(),
  decoration: InputDecoration(
    hintStyle: AppTextStyle(context).bodyText.copyWith(
          fontWeight: FontWeight.w500,
          color: colors(context).hintTextColor,
        ),
    filled: true,
    fillColor: colors(context).accentColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        color: colors(context).hintTextColor ??
            EcommerceAppColor.lightGray,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        color: colors(context).accentColor ??
            EcommerceAppColor.offWhite,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: colors(context).primaryColor ??
            EcommerceAppColor.primary,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: colors(context).errorColor ??
            EcommerceAppColor.red,
      ),
    ),
  ),
),
          Gap(20.h),

          /// Password
          CustomTextFormField(
            name: 'password',
            hintText: 'Password',
            controller: passwordController,
            textInputType: TextInputType.visiblePassword,
            obscureText: obscurePassword,
            focusNode: fNodes[2],
            textInputAction: TextInputAction.next,
            widget: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: colors(context).hintTextColor,
              ),
            ),
            validator: (value) => GlobalFunction.passwordValidator(
              value: value!,
              hintText: 'Password',
              context: context,
            ),
          ),
          Gap(20.h),

          /// Confirm Password
          CustomTextFormField(
            name: 'confirm_password',
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            textInputType: TextInputType.visiblePassword,
            obscureText: obscureConfirmPassword,
            focusNode: fNodes[3],
            textInputAction: TextInputAction.done,
            widget: IconButton(
              onPressed: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              icon: Icon(
                obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                color: colors(context).hintTextColor,
              ),
            ),
            validator: (value) {
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          Gap(30.h),

          /// Sign Up Button
          CustomButton(
            buttonText: 'Sign Up',
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign Up form validated')),
                );
              }
            },
          ),

          /// Already have an account
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: AppTextStyle(context).bodyText.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Gap(5.w),
              GestureDetector(
                onTap: () => Navigator.pop(context), // go back to login
                child: Text(
                  'Login',
                  style: AppTextStyle(context).bodyText.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colors(context).primaryColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
