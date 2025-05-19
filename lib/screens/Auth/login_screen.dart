// ... same imports as before

import 'package:ecommerceshoppingapp/common/custom_tetx_field.dart'
    show CustomTextFormField;
import 'package:ecommerceshoppingapp/config/app_tetx_style.dart';
import 'package:ecommerceshoppingapp/config/theme.dart';
import 'package:ecommerceshoppingapp/utilis/global_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../common/custom_button.dart';
import 'signup_screen.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final List<FocusNode> fNodes = [FocusNode(), FocusNode()];
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  bool obscurePassword = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 60.h,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do not have an account?',
                  style: AppTextStyle(
                    context,
                  ).bodyText.copyWith(fontWeight: FontWeight.w700),
                ),
                Gap(5.w),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpLayout(),
                      ),
                    );
                  },
                  child: Text(
                    'sign up',
                    style: AppTextStyle(context).bodyText.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colors(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [buildBody(context)],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ).copyWith(bottom: 20.h, top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'welcome back',
            style: AppTextStyle(
              context,
            ).title.copyWith(fontWeight: FontWeight.bold),
          ),
          Gap(20.h),
          CustomTextFormField(
            name: 'emailphone',
            hintText: 'email or phone',
            textInputType: TextInputType.text,
            controller: phoneController,
            focusNode: fNodes[0],
            textInputAction: TextInputAction.next,
            validator:
                (value) => GlobalFunction.commonValidator(
                  value: value!,
                  hintText: 'email or phone',
                  context: context,
                ),
          ),
          Gap(20.h),
          CustomTextFormField(
            name: 'password',
            hintText: 'password',
            textInputType: TextInputType.text,
            focusNode: fNodes[1],
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: obscurePassword,
            widget: IconButton(
              splashColor: Colors.transparent,
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
            validator:
                (value) => GlobalFunction.passwordValidator(
                  value: value!,
                  hintText: 'password',
                  context: context,
                ),
          ),
          Gap(20.h),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                //   Navigator.pushNamed(
                //   context,
                //   Routes.recoverPassword,
                //   arguments: true,
                // );
              },
              child: Text(
                'Forgot password?',
                style: AppTextStyle(context).bodyText,
              ),
            ),
          ),
          Gap(30.h),
          CustomButton(
            buttonText: 'Login',
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login form validated (API removed)')),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: TextButton(
                onPressed: () {},
                child: Text('Skip', style: AppTextStyle(context).buttonText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
