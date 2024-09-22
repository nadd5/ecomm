import '../../../../data/model/response/AddCartResponse.dart';
import '../../../../data/model/response/ProductResponse.dart';

abstract class ProductStates {}

//Products
class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductStates {
  ProductResponse response;

  ProductSuccessState({required this.response});
}
class AddCartLoadingState extends ProductStates {}

class AddCartErrorState extends ProductStates {
  String errorMessage;

  AddCartErrorState({required this.errorMessage});
}

class AddCartSuccessState extends ProductStates {
  AddCartResponse cartResponse;

  AddCartSuccessState({required this.cartResponse});
}

class ProductAlreadyInCartState extends ProductStates {}