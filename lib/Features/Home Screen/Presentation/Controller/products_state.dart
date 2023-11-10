part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.home,
    this.homeState = RequestState.isLoading,
    this.homeMessage = '',
  });

  final Home? home;
  final RequestState homeState;
  final String homeMessage;

  ProductsState copyWith({
    Home? home,
    RequestState? homeState,
    String? homeMessage,

  }) {
    return ProductsState(
      home: home ?? this.home,
      homeMessage: homeMessage ?? this.homeMessage,
      homeState: homeState ?? this.homeState,
    );
  }

  @override
  List<Object?> get props => [home, homeState, homeMessage];


}

