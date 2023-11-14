part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const[],
    this.categoriesState = RequestState.isLoading,
    this.categoriesMessage = '',
    this.productCategories = const[],
    this.productCategoriesState = RequestState.isLoading,
    this.productCategoriesMessage = '',
  });

  final List<Categories> categories;
  final RequestState categoriesState;
  final String categoriesMessage;
  final List<ProductsData> productCategories;
  final RequestState productCategoriesState;
  final String productCategoriesMessage;

  CategoryState copyWith({
    List<Categories>? categories,
    RequestState? categoriesState,
    String? categoriesMessage,
    List<ProductsData>? productCategories,
    RequestState? productCategoriesState,
    String? productCategoriesMessage,

  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      categoriesState: categoriesState ?? this.categoriesState,
      productCategories: productCategories ?? this.productCategories,
      productCategoriesMessage: productCategoriesMessage ??
          this.productCategoriesMessage,
      productCategoriesState: productCategoriesState ??
          this.productCategoriesState,

    );
  }

  @override
  List<Object> get props =>
      [
        categories,
        categoriesState,
        categoriesMessage,
        productCategories,
        productCategoriesState,
        productCategoriesMessage,
      ];

}

