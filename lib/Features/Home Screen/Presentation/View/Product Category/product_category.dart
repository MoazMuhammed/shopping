import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Core/Utills/Navigators/navigators.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Controller/Category/category_bloc.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Widget/App%20Bar/container_widget.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Widget/products_widget.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key, required this.id});

  final int id;

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  final categoryBloc = CategoryBloc(sl(), sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          categoryBloc..add(GetProductByCategoryEvent(widget.id.toString())),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
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
                    horizontal: 16.sp,
                  ),
                  child: GestureDetector(
                    onTap: () => pop(context),
                    child: Row(
                      children: [
                         AppSVG(assetName: 'arrowLeft',height: 3.h),
                        Text(
                          'Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: AppColors.black,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: false,
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 12.sp),
                    itemCount: state.productCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3.0.sp, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      if(state.productCategoriesState == RequestState.isLoading){
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

                      }else{
                        return ProductsWidget(
                            discount:
                            state.productCategories[index].discount.toString(),
                            imageName: state.productCategories[index].image,
                            itemName: state.productCategories[index].name,
                            categoryName:
                            state.productCategories[index].description,
                            price: state.productCategories[index].price.toString(), onPressProductDetails: () {  },);

                      }
                    },
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
