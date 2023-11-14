import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/banners.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_banners_useCase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_home.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.getHomeUseCase, this.getBannersUseCase)
      : super(const ProductsState()) {
    on<ProductsEvent>(
      getProductsEvent,
    );
    on<GetBannersEvent>(
      getBannerEvent,
    );
  }

  final GetHomeUseCase getHomeUseCase;
  final GetBannersUseCase getBannersUseCase;

  FutureOr<void> getProductsEvent(
      ProductsEvent event, Emitter<ProductsState> emit) async {
    final result = await getHomeUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            homeState: RequestState.error, homeMessage: l.message)),
        (r) => emit(
            state.copyWith(products: r, homeState: RequestState.isLoaded)));
  }

  FutureOr<void> getBannerEvent(
      ProductsEvent event, Emitter<ProductsState> emit) async {
    final result = await getBannersUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            homeBannersState: RequestState.error,
            homeBannersMessage: l.message)),
        (r) => emit(state.copyWith(
            banners: r, homeBannersState: RequestState.isLoaded)));
  }
}
