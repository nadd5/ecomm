import '../../../../../data/Errors/errors.dart';
import '../../../../../data/model/response/AddToWishlistResponse.dart';
import '../../../../../data/model/response/GetWishlistResponse.dart';

abstract class WishlistStates {}

class WishlistInitialState extends WishlistStates {}

class WishlistLoadingState extends WishlistStates {}

class WishlistErrorState extends WishlistStates {
  Errors errors;

  WishlistErrorState({required this.errors});
}

class WishlistSuccuessState extends WishlistStates {
  GetWishlistResponse response;

  WishlistSuccuessState({required this.response});
}

class AddWishlistLoadingState extends WishlistStates {}

class AddWishlistErrorState extends WishlistStates {
  Errors errors;

  AddWishlistErrorState({required this.errors});
}

class AddWishlistSuccuessState extends WishlistStates {
  AddToWishlistResponse response;

  AddWishlistSuccuessState({required this.response});
}

class DeleteWishlistLoadingState extends WishlistStates {}

class DeleteWishlistErrorState extends WishlistStates {
  Errors errors;

  DeleteWishlistErrorState({required this.errors});
}

class DeleteAddWishlistSuccuessState extends WishlistStates {
  GetWishlistResponse response;

  DeleteAddWishlistSuccuessState({required this.response});
}
