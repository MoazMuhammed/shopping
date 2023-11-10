import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';

class AppBarContainerWidget extends StatefulWidget {
  const AppBarContainerWidget({super.key, required this.iconName, this.isShow});

  final String iconName;
  final bool? isShow;

  @override
  State<AppBarContainerWidget> createState() => _AppBarContainerWidgetState();
}

class _AppBarContainerWidgetState extends State<AppBarContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 9.5.sp),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 11.sp, vertical: 11.sp),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(color: AppColors.secondary),
            ),
            child: AppSVG(assetName: widget.iconName,color: AppColors.primary),
          ),
          Visibility(
            visible: widget.isShow ?? false,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical:20.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.sp),
                    color: AppColors.primary),
                height: 0.8.h,
                child: const SizedBox()),
          ),

        ],
      ),
    );
  }
}
