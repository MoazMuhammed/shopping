import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Core/Utills/Navigators/navigators.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Core/Widget/Image/app_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Controller/Category/category_bloc.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Controller/products_bloc.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/View/Product%20Category/product_category.dart';
import 'package:shopping/Features/Product%20Details/Presentation/View/products_details.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Widget/App%20Bar/container_widget.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Widget/Categories/categories_widget.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Widget/products_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  final productsBloc = ProductsBloc(sl(), sl());
  final categoryBloc = CategoryBloc(sl(),sl());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productsBloc
            ..add(GetProductsEvent())
            ..add(GetBannersEvent()),
        ),
        BlocProvider(
          create: (context) => categoryBloc..add(GetCategoryEvent()),
        ),
      ],
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            horizontal: 16.sp, vertical: 5.sp),
                        child: SizedBox(
                          height: 12.h,
                          child: Row(
                            children: [
                               CategoriesWidget(
                                  imageCategory:
                                      'https://cdn.shoplightspeed.com/shops/601917/files/48868874/380x275x1/view-all-products.jpg',
                                  nameCategory: 'All Categories', onPressCategory: () {  },),
                              SizedBox(
                                width: 4.w,
                              ),
                              BlocBuilder<CategoryBloc, CategoryState>(
                                builder: (context, state) {
                                  return Expanded(
                                    child: ListView.builder(itemCount: state.categories.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        if (state.categoriesState ==
                                            RequestState.isLoaded) {
                                          return Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                end: 13.sp),
                                            child: CategoriesWidget(
                                                imageCategory: state
                                                    .categories[index]
                                                    .categoryImage,
                                                nameCategory: state
                                                    .categories[index]
                                                    .categoryName,
                                                widthNameCategory: 18.w, onPressCategory: () {
                                                   push(context, ProductCategoryScreen(id: state.categories[index].id,));

                                            },),
                                          );
                                        } else {
                                          return SizedBox(
                                            width: 200.0,
                                            height: 100.0,
                                            child: Shimmer.fromColors(
                                                baseColor: Colors.grey.shade300,
                                                highlightColor: Colors.grey.shade100,
                                                child:  Padding(
                                                  padding: EdgeInsetsDirectional.only(
                                                      end: 13.sp),
                                                  child: CategoriesWidget(
                                                      imageCategory: '',
                                                      nameCategory: '',
                                                      widthNameCategory: 18.w, onPressCategory: () {  },),
                                                )),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: AppColors.secondary,
                        height: 0.5.h,
                        thickness: 5.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.sp, vertical: 12.sp),
                        child: Row(
                          children: [
                            Text(
                              'Recommended Products',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Text(
                              'See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: AppColors.primaryLight,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const AppSVG(
                              assetName: 'arrowRight',
                              color: AppColors.primaryLight,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 108.sp,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: false,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.sp, horizontal: 12.sp),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 3.0.sp,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              if (state.homeState == RequestState.isLoaded) {
                                final product = state.products[index];
                                return ProductsWidget(
                                    discount: product.discount.toString(),
                                    imageName: product.image,
                                    itemName: product.name,
                                    categoryName: product.description,
                                    price: product.price.toString(), onPressProductDetails: () {
                                      push(context, ProductsDetailsScreen(id: product.id));

                                },);
                              } else {
                                return SizedBox(
                                  width: 200.0,
                                  height: 100.0,
                                  child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child:  ProductsWidget(
                                          discount: '',
                                          imageName: '',
                                          itemName: '',
                                          categoryName: '',
                                          price: '', onPressProductDetails: () {  },)),
                                );
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.sp),
                        child: Material(
                          elevation: 10.0,
                          shadowColor: Colors.grey,
                          borderRadius: BorderRadius.circular(14.sp),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.sp),
                                color: AppColors.secondaryLight),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp, vertical: 12.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Why We Are Different?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        color: AppColors.primary,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1,
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14.sp),
                                                color: AppColors.primary),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.sp,
                                                  horizontal: 10.sp),
                                              child: Column(
                                                children: [
                                                  AppSVG(
                                                      assetName: 'nature',
                                                      color: Colors.white,
                                                      height: 6.h),
                                                  Text(
                                                    "Nature",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.sp,
                                                        color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14.sp),
                                              color: AppColors.primary),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.sp,
                                                horizontal: 10.sp),
                                            child: Column(
                                              children: [
                                                AppSVG(
                                                    assetName: 'organic',
                                                    color: Colors.white,
                                                    height: 6.h),
                                                Text(
                                                  "Organic",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.sp,
                                                      color: Colors.white,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14.sp),
                                              color: AppColors.primary),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.sp,
                                                horizontal: 10.sp),
                                            child: Column(
                                              children: [
                                                AppSVG(
                                                    assetName: 'fair',
                                                    color: Colors.white,
                                                    height: 6.h),
                                                Text(
                                                  "Fair",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.sp,
                                                      color: Colors.white,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14.sp),
                                              color: AppColors.primary),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.sp,
                                                horizontal: 10.sp),
                                            child: Column(
                                              children: [
                                                AppSVG(
                                                    assetName: 'drink',
                                                    color: Colors.white,
                                                    height: 6.h),
                                                Text(
                                                  "Responsibly",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.sp,
                                                      color: Colors.white,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                  Text(
                                    "Human diversity is shaped by environment and culture. Embracing these differences promotes inclusivity and harmony in society.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: AppColors.primary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      state.banners.isEmpty ? const SizedBox():
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: Column(
                          children: [
                            CarouselSlider.builder(
                              itemCount: state.banners.length,
                              itemBuilder: (context, index, realIndex) =>
                                  SizedBox(
                                width: 75.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: AppImage(
                                      imageUrl: '${state.banners[index].image}',
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
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                                height: 18.h,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                            DotsIndicator(
                              decorator: const DotsDecorator(
                                  activeColor: AppColors.primary,
                                  color: AppColors.secondaryLight),
                              dotsCount: state.banners.length,
                              position: currentIndex,
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
        },
      ),
    );
  }
}
