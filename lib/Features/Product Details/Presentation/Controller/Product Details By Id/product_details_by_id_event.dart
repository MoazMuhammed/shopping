part of 'product_details_by_id_bloc.dart';

abstract class ProductDetailsByIdEvent extends Equatable {
  const ProductDetailsByIdEvent();

  @override
  List<Object> get props => [];
}

class GetProductsDetailsByIdEvent extends ProductDetailsByIdEvent {
  final int id;

  const GetProductsDetailsByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}
