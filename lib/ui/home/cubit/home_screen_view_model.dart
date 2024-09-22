import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/model/response/GetCartResponse.dart';
import '../../tabs/favorite_tab/favourite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/menu_tab/menuTab.dart';
import '../../tabs/profile_tab.dart';
import 'home_screen_state.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  GetProductCart productCart = GetProductCart();

  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    MenuTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  void changeSelectedIndex(int newIndex) {
    if (newIndex >= 0 && newIndex < tabs.length) {
      selectedIndex = newIndex;
      emit(ChangeSelectedIndexState());
    }
  }
}
