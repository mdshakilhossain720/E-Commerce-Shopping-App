import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class GlobalFunction {
  static void changeStatusBarTheme({required isDark}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void showCustomSnackbar({
    required String message,
    required bool isSuccess,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: isSuccess
          ? Colors.indigo
          : Colors.red,
      content: Text(message),
    );
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
        .showSnackBar(snackBar);
  }

//   static Future<void> pickImageFromGallery({required WidgetRef ref}) async {
//     final picker = ImagePicker();
//     await picker.pickImage(source: ImageSource.gallery).then((imageFile) {
//       if (imageFile != null) {
//         ref.read(selectedUserProfileImage.notifier).state = imageFile;
//       }
//     });
//   }

  static String errorText(
      {required String fieldName, required BuildContext context}) {
    return '$fieldName is required';
  }

  static String? commonValidator({
    required String value,
    required String hintText,
    required BuildContext context,
  }) {
    if (value.isEmpty) {
      return errorText(fieldName: hintText, context: context);
    }
    return null;
  }

  static String? phoneValidator({
    required String value,
    required String hintText,
    required BuildContext context,
    int? minLength,
    int? maxLength,
    bool? isPhoneRequired,
  }) {
    // Step 1: Check if input is required and empty
    if (isPhoneRequired == true && value.isEmpty) {
      return errorText(fieldName: hintText, context: context);
    }

    // Step 2: Only validate length if a value is provided
    if (value.isNotEmpty) {
      if (minLength != null && value.length < minLength) {
        return 'Please enter a valid $hintText with at least $minLength characters';
      }
      if (maxLength != null && value.length > maxLength) {
        return 'Please enter a valid $hintText with at most $maxLength characters';
      }
    }

    return null;
  }

  static String? emailValidator({
    required String value,
    required String hintText,
    required BuildContext context,
  }) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (value.isEmpty) {
      return errorText(fieldName: hintText, context: context);
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid $hintText';
    }
    return null;
  }

  static String? passwordValidator({
    required String value,
    required String hintText,
    required BuildContext context,
  }) {
    if (value.isEmpty) {
      return errorText(fieldName: hintText, context: context);
    } else if (value.length < 6) {
      return 'Please enter a valid $hintText with at least 6 characters';
    }

    return null;
  }



  



 

 
 



 
}
