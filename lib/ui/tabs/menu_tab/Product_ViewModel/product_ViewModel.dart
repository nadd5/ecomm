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
    var either = await ApiManager.addToCart(productId);
    either.fold(
            (error) => emit(AddCartErrorState(errorMessage: error.toString())),
            (response) {
          numOfCartItem = response.numOfCartItems!.toInt();
          print(numOfCartItem.toInt());
          emit(AddCartSuccessState(cartResponse: response));
        });
  }

  bool isProductInCart(Product product) {
    return cartItems.contains(product);
  }
}