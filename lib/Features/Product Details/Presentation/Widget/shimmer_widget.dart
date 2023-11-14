import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Widget/App%20Bar/container_widget.dart';

class ShimmerProductDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.sp, vertical: 16.sp),
          child: Row(
            children: [
              Text(
                "Shoppy",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: AppColors.primaryLight),
              ),
              const Spacer(),
              const AppBarContainerWidget(
                iconName: 'search',
                isShow: false,
              ),
              const AppBarContainerWidget(
                iconName: 'favourite',
                isShow: false,
              ),
              const AppBarContainerWidget(
                iconName: 'shopping',
                isShow: true,
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.secondary,
          height: 0.5.h,
          thickness: 5.sp,
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.sp, ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.sp,  // Set an appropriate height for the shimmer container
                  color: Colors.grey[200],
                ),
                SizedBox(height: 1.h),
                Container(
                  height: 25.h,  // Set an appropriate height for the shimmer container
                  color: Colors.grey[200],
                ),
                SizedBox(height: 1.h),
                Container(
                  height: 20.sp,  // Set an appropriate height for the shimmer container
                  color: Colors.grey[200],
                ),
                SizedBox(height: 1.h),
                Container(
                  height: 20.sp,  // Set an appropriate height for the shimmer container
                  color: Colors.grey[200],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}