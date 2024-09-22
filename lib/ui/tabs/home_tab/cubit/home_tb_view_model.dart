import 'package:bloc/bloc.dart';
import '../../../../data/api_manager.dart';
import '../../../../data/model/response/CategoryResponse.dart';
import 'home_tab_state.dart';
class HomeTabViewModel extends Cubit<HomeTabState> {
  HomeTabViewModel() : super(HomeTabInitialState());
  List<CategoryOrBrand>? categoriesList;

  List<CategoryOrBrand>? brandsList;

  void getAllCategories() async {
    try {
      emit(HomeTabCategoryLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeTabCategoryErrorState(errorMessage: response.message!));
      } else {
        categoriesList = response.data ?? [];
        if (categoriesList != null) {
          emit(HomeTabCategorySuccessState(categoryResponse: response));
        }
      }
    } catch (e) {
      emit(HomeTabCategoryErrorState(errorMessage: e.toString()));
    }
  }

  void getAllBrands() async {
    try {
      emit(HomeTabBrandLoadingState());
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HomeTabBrandErrorState(errorMessage: response.message!));
      } else {
        brandsList = response.data ?? [];
        if (brandsList != null) {
          emit(HomeTabBrandSuccessState(categoryResponse: response));
        }
      }
    } catch (e) {
      emit(HomeTabBrandErrorState(errorMessage: e.toString()));
    }
  }
}