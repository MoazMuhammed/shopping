import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Core/Widget/Image/app_image.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Widget/App%20Bar/container_widget.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({super.key, required this.itemDescription, required this.itemName, required this.itemPrice, required this.itemOldPrice, required this.imageString, required this.itemDiscount, required this.itemSliderCounter, required this.dotsCountCounter});
  final String itemDescription;
  final String itemName;
  final String itemPrice;
  final String itemOldPrice;
  final List<String> imageString;
  final String itemDiscount;
  final int itemSliderCounter;
  final int dotsCountCounter;


  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  CarouselController carouselController = CarouselController();
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.h),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(14.sp)),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 1.h),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.itemSliderCounter,
                    itemBuilder:
                        (context, index, realIndex) =>
                        SizedBox(
                          width: 75.w,
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(20),
                            child: AppImage(
                                imageUrl: widget.imageString[index],
                                width: 16.h,
                                height: 16.h),
                          ),
                        ),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      animateToClosest: true,
                      pageSnapping: true,
                      padEnds: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.7,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval:
                      const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.easeInOutCirc,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.7,
                      scrollDirection: Axis.horizontal,
                      height: 25.h,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  DotsIndicator(
                    decorator:  DotsDecorator(activeShape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(14.sp)) ),activeSize: Size(20.sp,10.sp),
                        activeColor: AppColors.primary,
                        color: AppColors.primaryLight),
                    dotsCount: widget.dotsCountCounter,
                    position: currentIndex,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.sp, vertical: 10.sp),
            child: Text(
              widget.itemName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.black,
                  overflow: TextOverflow.ellipsis),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.sp, vertical: 10.sp),
            child: Row(
              children: [
                Text(
                  widget.itemPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.primary,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'EGP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.primary,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 5.w,),
                 Text(
                   widget.itemOldPrice,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColors.primary,
                    overflow: TextOverflow.ellipsis,          decoration: TextDecoration.lineThrough,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                 Text(
                  'EGP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.primary,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                SizedBox(
                  width: 22.w,
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
                          widget.itemDiscount
                              .toString(),
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
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text(
              'Description',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: AppColors.primaryLight,
                  overflow: TextOverflow.ellipsis),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Divider(
              color: AppColors.secondary,
              height: 0.5.h,
              thickness: 5.sp,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 10.sp,
                ),
                child: Text(
                  widget.itemDescription,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
