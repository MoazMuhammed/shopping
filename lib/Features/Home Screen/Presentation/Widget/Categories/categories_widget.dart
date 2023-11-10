import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Widget/Image/app_image.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key, required this.imageCategory, required this.nameCategory, this.widthNameCategory});
  final String imageCategory;
  final String nameCategory;
  final double? widthNameCategory;


  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.sp),
          child: AppImage(
              imageUrl: widget.imageCategory,
              width: 10.h,
              height: 9.h),
        ),
        SizedBox(
          width: widget.widthNameCategory,
          child: Text(
            widget.nameCategory,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: AppColors.primaryLight,
                overflow: TextOverflow.ellipsis),maxLines: 1,overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
