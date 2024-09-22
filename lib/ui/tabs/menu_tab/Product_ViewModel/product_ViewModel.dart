import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/api_manager.dart';
import '../../../../data/model/response/ProductResponse.dart';
import '../cubit/productStates.dart';

class ProductViewModel extends Cubit<ProductStates> {
  ProductViewModel() : super(ProductInitialState());

  List<Product>? productList;

  List<Product> cartItems = [];
  int numOfCartItem = 0;

  static ProductViewModel get(context) => BlocProvider.of(context);

  void getAllProduct() async {
    try {
      emit(ProductLoadingState());
      var response = await ApiManager.getAllProducts();
      if (response.statusMsg == 'fail') {
        emit(ProductErrorState(errorMessage: response.message!));
      } else {
        productList = response.data ?? [];
        emit(ProductSuccessState(response: response));
      }
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  void addToCart(String productId) async {
    if (!isProductInCart(productId as Product)) {
      var either = await ApiManager.addToCart(productId);
      either.fold(
            (error) => emit(AddCartErrorState(errorMessage: error.toString())),
            (response) {
          cartItems.add(productId as Product);

          numOfCartItem = response.numOfCartItems!.toInt();

          emit(AddCartSuccessState(cartResponse: response));
        },
      );
    } else {
      emit(AddCartErrorState(errorMessage: "Product is already in the cart."));
    }
  }

  bool isProductInCart(Product product) {
    return cartItems.any((item) => item.id == product.id);
  }
}
