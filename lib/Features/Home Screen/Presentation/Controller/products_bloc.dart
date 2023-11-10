import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/home.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_home.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.getHomeUseCase) : super(const ProductsState()) {
    on<ProductsEvent>(getProductsEvent);
  }
final GetHome getHomeUseCase;



  FutureOr<void> getProductsEvent(ProductsEvent event, Emitter<ProductsState> emit) async {
    final result = await getHomeUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            homeState:RequestState.error,
            homeMessage: l.message)),
            (r) => emit(state.copyWith(
            home: r, homeState: RequestState.isLoaded)));

  }
}
