import '../../../../data/model/response/CategoryResponse.dart';

abstract class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

class HomeTabCategoryLoadingState extends HomeTabState {}

class HomeTabCategoryErrorState extends HomeTabState {
  String errorMessage;

  HomeTabCategoryErrorState({required this.errorMessage});
}

class HomeTabCategorySuccessState extends HomeTabState {
  CategoryOrBrandResponse categoryResponse;

  HomeTabCategorySuccessState({required this.categoryResponse});
}

class HomeTabBrandLoadingState extends HomeTabState {}

class HomeTabBrandErrorState extends HomeTabState {
  String errorMessage;

  HomeTabBrandErrorState({required this.errorMessage});
}

class HomeTabBrandSuccessState extends HomeTabState {
  CategoryOrBrandResponse categoryResponse;

  HomeTabBrandSuccessState({required this.categoryResponse});
}

