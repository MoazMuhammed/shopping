import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Product%20Details/Domain/Repository/base_products_details.dart';

class GetProductByIdUSeCase
    extends BaseUsecase<ProductsData, ProductID> {
  final BaseProductsDetailsRepository baseProductsDetails;

  GetProductByIdUSeCase(this.baseProductsDetails);

  @override
  Future<Either<Failure, ProductsData>> call(
  ProductID id) async {
    return await baseProductsDetails.getProductDetails(id);
  }


}

class ProductID extends Equatable {
  final int id;

  const ProductID({required this.id});

  @override
  List<Object> get props => [id];

}