import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../common/custom_button.dart';
import '../../common/custom_tetx_field.dart';
import '../../config/theme.dart';
import '../../utilis/global_function.dart';


class ChangePasswordLayout extends StatefulWidget {
  const ChangePasswordLayout({super.key});

  @override
  State<ChangePasswordLayout> createState() => _ChangePasswordLayoutState();
}

class _ChangePasswordLayoutState extends State<ChangePasswordLayout> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  bool obscureOld = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //backgroundColor: GlobalFunction.getBackgroundColor(context: context),
        appBar: AppBar(
          title: Text(
            "Change Password",
          ),
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                Gap(10.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  width: double.infinity,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        name: 'currentpassword',
                        hintText: 'Current Password',
                        textInputType: TextInputType.text,
                        controller: oldPasswordController,
                        textInputAction: TextInputAction.next,
                        obscureText: obscureOld,
                        widget: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(() => obscureOld = !obscureOld);
                          },
                          icon: Icon(
                            obscureOld ? Icons.visibility_off : Icons.visibility,
                            color: colors(context).hintTextColor,
                          ),
                        ),
                        validator: (value) => GlobalFunction.commonValidator(
                          value: value!,
                          hintText: 'Current Password',
                          context: context,
                        ),
                      ),
                      Gap(24.h),
                      CustomTextFormField(
                        name: 'newpassword',
                        hintText: 'Create New Password',
                        textInputType: TextInputType.text,
                        controller: newPasswordController,
                        textInputAction: TextInputAction.next,
                        obscureText: obscureNew,
                        widget: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(() => obscureNew = !obscureNew);
                          },
                          icon: Icon(
                            obscureNew ? Icons.visibility_off : Icons.visibility,
                            color: colors(context).hintTextColor,
                          ),
                        ),
                        validator: (value) => GlobalFunction.commonValidator(
                          value: value!,
                          hintText: 'Create New Password',
                          context: context,
                        ),
                      ),
                      Gap(24.h),
                      CustomTextFormField(
                        name: 'confirmpassword',
                        hintText: 'Confirm New Password',
                        textInputType: TextInputType.text,
                        controller: confirmNewPasswordController,
                        textInputAction: TextInputAction.done,
                        obscureText: obscureConfirm,
                        widget: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(() => obscureConfirm = !obscureConfirm);
                          },
                          icon: Icon(
                            obscureConfirm ? Icons.visibility_off : Icons.visibility,
                            color: colors(context).hintTextColor,
                          ),
                        ),
                        validator: (value) => GlobalFunction.commonValidator(
                          value: value!,
                          hintText: 'Confirm New Password',
                          context: context,
                        ),
                      ),
                      Gap(24.h),
                      CustomButton(
                        buttonText: 'Update Password',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // For UI-only, just clear fields or show a local message
                            oldPasswordController.clear();
                            newPasswordController.clear();
                            confirmNewPasswordController.clear();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Password updated locally (UI only).'),
                                backgroundColor: colors(context).primaryColor,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
