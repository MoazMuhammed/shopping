part of 'product_details_by_id_bloc.dart';

class ProductDetailsByIdState extends Equatable {
  const ProductDetailsByIdState({
    this.productDetailsById,
    this.productDetailsByIdState = RequestState.isLoading,
    this.productDetailsByIdMessage = '',
  });

  final ProductsData? productDetailsById;
  final RequestState productDetailsByIdState;
  final String productDetailsByIdMessage;

  ProductDetailsByIdState copyWith({
    ProductsData? productDetailsById,
    RequestState? productDetailsByIdState,
    String? productDetailsByIdMessage,
  }) {
    return ProductDetailsByIdState(
      productDetailsById: productDetailsById ?? this.productDetailsById,
      productDetailsByIdMessage: productDetailsByIdMessage ??
          this.productDetailsByIdMessage,
      productDetailsByIdState: productDetailsByIdState ??
          this.productDetailsByIdState,
    );
  }

  @override
  List<Object?> get props =>
      [productDetailsById, productDetailsByIdState, productDetailsByIdMessage,];
}

