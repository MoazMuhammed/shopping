import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Core/Widget/Button/button.dart';
import 'package:shopping/Core/Widget/Image/app_image.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key, required this.discount, required this.imageName, required this.itemName, required this.categoryName, required this.price});
  final String discount;
  final String imageName;
  final String itemName;
  final String categoryName;
  final String price;
  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 10.sp, horizontal: 12.sp),
      child: Material(
        borderRadius: BorderRadius.circular(14.sp),
        elevation: 12.0,
        shadowColor: Colors.black38,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.sp, vertical: 16.sp),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Center(
                      child: AppImage(
                          imageUrl:
                         widget.imageName,
                          width: 16.h,
                          height: 16.h),
                    ),
                    const AppSVG(
                      assetName: 'favourite',
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.primaryLight,
                height: 0.5.h,
                thickness: 5.sp,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 12.sp),
                child: Text(
                  widget.itemName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.primary,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 12.sp),
                child: Text(
                  widget.categoryName,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryLight),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 12.sp),
                child: Row(
                  children: [
                    Text(
                      widget.price,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.primaryLight),
                    ),
                    SizedBox(
                      width: 0.4.w,
                    ),
                    Text(
                      "EGY",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: AppColors.primaryLight),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.sp, vertical: 8.sp),
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius:
                            BorderRadius.circular(10.sp)),
                        child: Row(
                          children: [
                            AppSVG(
                              assetName: 'discount',
                              color: Colors.white,
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              widget.discount,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  overflow:
                                  TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            Expanded(
                              child: Text(
                                "% discount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    overflow:
                                    TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 12.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: () {},
                        label: 'Add to cart',
                        sizeFont: 14.sp,
                        bgColor: Colors.white,
                        textColor: AppColors.primary,
                        borderRadius:
                        BorderRadius.circular(14.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.sp, horizontal: 0.sp),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: AppButton(
                        onPressed: () {},
                        label: 'Add to cart',
                        sizeFont: 14.sp,
                        bgColor: AppColors.secondaryLight,
                        textColor: Colors.white,
                        borderRadius:
                        BorderRadius.circular(14.sp),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.sp, horizontal: 0.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
