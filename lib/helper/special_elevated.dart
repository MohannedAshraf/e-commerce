import 'package:e_commerce/helper/app_colors.dart';
import 'package:flutter/material.dart';

class SpecialElevated extends StatelessWidget {
  const SpecialElevated({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.background,
      ),
      child: ElevatedButton(
        onPressed: () {
          //show items matching with title chosen
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.prim,
          ),
        ),
      ),
    );
  }
}
