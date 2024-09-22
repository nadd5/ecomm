import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../ui/utils/shared_preference_utils.dart';
import 'Errors/errors.dart';
import 'end_point.dart';
import 'model/Request/LoginRequest.dart';
import 'model/Request/RegisterRequest.dart';
import 'model/response/AddCartResponse.dart';
import 'model/response/AddToWishlistResponse.dart';
import 'model/response/CategoryResponse.dart';
import 'model/response/GetCartResponse.dart';
import 'model/response/GetWishlistResponse.dart';
import 'model/response/LoginResponse.dart';
import 'model/response/ProductResponse.dart';
import 'model/response/RegisterResponse.dart';

class ApiManager
{
  static Future<RegisterResponse> register(String name, String email,
      String password, String rePassword, String phone) async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.signUp);
    var registerRequest = RegisterRequest(
        email: email ,
        name:  name,
        password:  password,
        phone: phone ,
        rePassword: rePassword);
    try {
      var response = await http.post(url, body: registerRequest.toJson());
      var bodyString = response.body; //String
      var json = jsonDecode(bodyString); //json
      return RegisterResponse.fromJson(json);
      //  RegisterResponse.fromJson(jsonDecode(response.body));
    }
    catch(e)
    {
      throw e ;
    }
  }

  static Future<LoginResponse> Login(String email, String password) async {
    Uri url = Uri.https(EndPoints.baseUrl ,EndPoints.Login );
    LoginRequest loginRequest = LoginRequest(
      email: email ,
      password: password ,
    );
    try {
      var response = await http.post(url, body: loginRequest.toJson());
      var bodyString = response.body; //String
      var json = jsonDecode(bodyString); //json
      return LoginResponse.fromJson(json);
    }
    catch(e)
    {
      throw e;
    }

  }

  static Future<CategoryOrBrandResponse> getAllCategories() async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.categories);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllBrands() async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.brands);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponse> getAllProducts() async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.products);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return ProductResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<Either<Errors, AddCartResponse>> addToCart(
      String productId) async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.add_to_cart);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, AddToWishlistResponse>> addToWishlist(
      String productId) async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.add_to_wishList);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddToWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetCartResponse>> getCart() async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.add_to_cart);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse = GetCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetWishlistResponse>> getWishlist() async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.add_to_wishList);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getWishlistResponse = GetWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getWishlistResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetCartResponse>> deleteItemCart(
      String productId) async {
    Uri url = Uri.https(
        EndPoints.baseUrl, '${EndPoints.add_to_cart}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response =
      await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemFromCart = GetCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromCart);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemFromCart.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemFromCart.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetWishlistResponse>> deleteItemFromWishlist(
      String productId) async {
    Uri url = Uri.https(
        EndPoints.baseUrl, '${EndPoints.add_to_wishList}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response =
      await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemFromWishlist = GetWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromWishlist);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemFromWishlist.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemFromWishlist.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetCartResponse>> updateCountInCart(
      String productId, int count) async {
    Uri url = Uri.https(
        EndPoints.baseUrl, '${EndPoints.add_to_cart}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': '$count'});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var updateCountInCartResponse = GetCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCountInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      } else {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
//if brand==success h-emit el success
//var loginResponse=LoginResponse.fromJson(json);

