import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Core/Widget/Button/button.dart';
import 'package:shopping/Features/Product%20Details/Presentation/Widget/product_details_widget.dart';
import 'package:shopping/Features/Product%20Details/Presentation/Controller/Product%20Details%20By%20Id/product_details_by_id_bloc.dart';
import 'package:shopping/Features/Product%20Details/Presentation/Widget/shimmer_widget.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  final productDetailsBloc = ProductDetailsByIdBloc(sl());
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          productDetailsBloc..add(GetProductsDetailsByIdEvent(widget.id)),
      child: BlocBuilder<ProductDetailsByIdBloc, ProductDetailsByIdState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: SafeArea(
                        child: Scaffold(
                      body:
                      state.productDetailsByIdState == RequestState.isLoading ? ShimmerProductDetailsWidget():
                      ProductDetailsWidget(
                          itemDescription: state.productDetailsById!.description,
                          itemName: state.productDetailsById!.name,
                          itemPrice: state.productDetailsById!.price.toString(),
                          itemOldPrice: state.productDetailsById!.oldPrice.toString(),
                          imageString: state.productDetailsById!.images,
                          itemDiscount: state.productDetailsById!.discount.toString(),
                          itemSliderCounter: state.productDetailsById!.images.length,
                          dotsCountCounter: state.productDetailsById!.images.length),
                      bottomNavigationBar: Material(
                        elevation: 10.0,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(14.sp),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.sp, horizontal: 20.sp),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14.sp),
                                    topRight: Radius.circular(14.sp))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Material(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(14.sp),
                                    child: AppButton(
                                        onPressed: () {},
                                        borderRadius:
                                            BorderRadius.circular(14.sp),
                                        label: 'Add To Cart',
                                        sizeFont: 14.sp,
                                        bgColor: AppColors.secondaryLight,
                                        textColor: AppColors.primary),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Material(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(14.sp),
                                    child: AppButton(
                                        onPressed: () {},
                                        borderRadius:
                                            BorderRadius.circular(14.sp),
                                        label: 'Add To Cart',
                                        sizeFont: 14.sp,
                                        bgColor: AppColors.primary,
                                        textColor: AppColors.secondaryLight),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )),
                  )),
            ),
          );
        },
      ),
    );
  }
}
