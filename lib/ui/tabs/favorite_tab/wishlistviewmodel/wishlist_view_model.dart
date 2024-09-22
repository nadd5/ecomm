import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/api_manager.dart';
import '../../../../data/model/response/GetWishlistResponse.dart';
import 'cubit/wishlist_states.dart';

class WishListViewModel extends Cubit<WishlistStates> {
  WishListViewModel() : super(WishlistInitialState());
  List<GetWishlistData> wishList = [];

  static WishListViewModel get(context) => BlocProvider.of(context);

  void getWishlistItems() async {
    emit(WishlistLoadingState());
    var either = await ApiManager.getWishlist();
    either.fold((error) => emit((WishlistErrorState(errors: error))),
            (response) {
          wishList = response.data!;
          emit(WishlistSuccuessState(response: response));
        });
  }

  void addToWishlist(String productId) async {
    var either = await ApiManager.addToWishlist(productId);
    either.fold((error) => emit(AddWishlistErrorState(errors: error)),
            (response) {
          emit(AddWishlistSuccuessState(response: response));
        });
  }

  void deleteItemFromWishlist(String productId) async {
    emit(DeleteWishlistLoadingState());

    var either = await ApiManager.deleteItemFromWishlist(productId);
    either.fold((l) => emit(DeleteWishlistErrorState(errors: l)), (r) {
      emit(WishlistSuccuessState(response: r));
    });
  }
}
