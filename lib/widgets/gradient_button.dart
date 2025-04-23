import 'package:ecommerceshoppingapp/theme/theme.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  VoidCallback? onButtonPressed;
  final List<Color> colors;
  final double height;
  final double? width;
  bool isLoading;

  GradientButton({
    super.key,
    required this.title,
    this.colors = AppTheme.primaryGradient,
    this.height = 56,
    this.isLoading = false,
    this.width,
    required Null Function() onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.first.withOpacity(0.3),

            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.zero,
        ),

        onPressed: isLoading ? null : onButtonPressed,
        child:
            isLoading
                ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                : Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
      ),
    );
  }
}
