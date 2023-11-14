import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Product%20Details/Domain/Use%20Case/get_product_by_id_useCase.dart';

part 'product_details_by_id_event.dart';
part 'product_details_by_id_state.dart';

class ProductDetailsByIdBloc extends Bloc<ProductDetailsByIdEvent, ProductDetailsByIdState> {
  ProductDetailsByIdBloc(this.getProductByIdUSeCase) : super(const ProductDetailsByIdState()) {
    on<GetProductsDetailsByIdEvent>(getProductsDetailsByIdEvent);
  }
  final GetProductByIdUSeCase getProductByIdUSeCase;

  Future<FutureOr<void>> getProductsDetailsByIdEvent(GetProductsDetailsByIdEvent event, Emitter<ProductDetailsByIdState> emit) async {
    final result = await getProductByIdUSeCase(ProductID(id: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            productDetailsByIdState: RequestState.error, productDetailsByIdMessage: l.message)),
            (r) {
              emit(
            state.copyWith(productDetailsById: r, productDetailsByIdState: RequestState.isLoaded));
            });

  }
}
