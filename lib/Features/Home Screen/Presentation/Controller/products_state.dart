part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.products = const [],
    this.homeState = RequestState.isLoading,
    this.homeMessage = '',
  });

  final List<ProductsData> products;
  final RequestState homeState;
  final String homeMessage;

  ProductsState copyWith({
    List<ProductsData>? products,
    RequestState? homeState,
    String? homeMessage,

  }) {
    return ProductsState(
      products: products ?? this.products,
      homeMessage: homeMessage ?? this.homeMessage,
      homeState: homeState ?? this.homeState,
    );
  }

  @override
  List<Object?> get props => [products, homeState, homeMessage];


}

