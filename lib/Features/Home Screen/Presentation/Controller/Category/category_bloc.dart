import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/category.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_category_useCase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_product_by_category_useCase.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.getCategoryUseCase, this.getProductByCategoryUseCase) : super(const CategoryState()) {
    on<CategoryEvent>(getCategoryEvent);
    on<GetProductByCategoryEvent>(getProductByCategoryEvent);
  }

  final GetCategoryUseCase getCategoryUseCase;
  final GetProductByCategoryUseCase getProductByCategoryUseCase;

  Future<FutureOr<void>> getCategoryEvent(
      CategoryEvent event, Emitter<CategoryState> emit) async {
    final result = await getCategoryUseCase(const NoParameters());
    result.fold(
            (l) =>
            emit(state.copyWith(
                categoriesState: RequestState.error,
                categoriesMessage: l.message)),
            (r) =>
            emit(state.copyWith(
                categories: r, categoriesState: RequestState.isLoaded)));
  }

  Future<FutureOr<void>> getProductByCategoryEvent(GetProductByCategoryEvent event, Emitter<CategoryState> emit) async {
    final result = await getProductByCategoryUseCase(CategoryId(id: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            productCategoriesState: RequestState.error, productCategoriesMessage: l.message)),
            (r) => emit(state.copyWith(
            productCategories: r, productCategoriesState: RequestState.isLoaded)));

  }
}
