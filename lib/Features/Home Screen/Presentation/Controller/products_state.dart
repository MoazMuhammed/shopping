part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.products = const [],
    this.homeState = RequestState.isLoading,
    this.homeMessage = '',
    this.banners = const [],
    this.homeBannersState = RequestState.isLoading,
    this.homeBannersMessage = '',
  });

  final List<ProductsData> products;
  final RequestState homeState;
  final String homeMessage;
  final List<BannersData> banners;
  final RequestState homeBannersState;
  final String homeBannersMessage;

  ProductsState copyWith({
    List<ProductsData>? products,
    RequestState? homeState,
    String? homeMessage,
    List<BannersData>? banners,
    RequestState? homeBannersState,
    String? homeBannersMessage,

  }) {
    return ProductsState(
      products: products ?? this.products,
      homeMessage: homeMessage ?? this.homeMessage,
      homeState: homeState ?? this.homeState,
      banners: banners ?? this.banners,
      homeBannersState: homeBannersState ?? this.homeBannersState,
      homeBannersMessage: homeBannersMessage ?? this.homeBannersMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        products,
        homeState,
        homeMessage,
        banners,
        homeBannersState,
        homeBannersMessage,
      ];

}

