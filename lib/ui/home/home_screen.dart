import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tabs/Menu_tab/Product_ViewModel/product_ViewModel.dart';
import '../tabs/home_tab/cubit/HomeScreenStates.dart';
import '../utils/appcolor.dart';
import 'cubit/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName= 'home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {

        return Scaffold(
          backgroundColor:AppColors.whiteColor,
          body: viewModel.tabs[viewModel.selectedIndex],
          bottomNavigationBar: DotCurvedBottomNav(
            backgroundColor: AppColors.primaryColor,
            indicatorColor: AppColors.primaryColor,
            selectedIndex: viewModel.selectedIndex,
            height: 60,
            borderRadius: 10,
            items: [
              Icon(
                Icons.home_rounded,
                color: viewModel.selectedIndex == 0 ? Colors.white : Colors.white.withOpacity(0.6),
              ),
              Icon(
                Icons.category_rounded,
                color: viewModel.selectedIndex == 1 ? Colors.white : Colors.white.withOpacity(0.6),
              ),
              Icon(
                Icons.favorite_rounded,
                color: viewModel.selectedIndex == 2 ? Colors.white : Colors.white.withOpacity(0.6),
              ),
              Icon(
                Icons.person_rounded,
                color: viewModel.selectedIndex == 3 ? Colors.white : Colors.white.withOpacity(0.6),
              ),
            ],
            onTap: (index) {
              setState(() {
                viewModel.changeSelectedIndex(index);
              });
            },
          ),
        );
      },
    );
  }
}
class AppSearchBar extends StatefulWidget {
  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  ProductViewModel viewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                labelText: "what do you search for?",
                labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColors.bgDarkColor),
                prefixIcon: ImageIcon(
                  AssetImage('assets/icon _search_.png'),
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
        ),
        InkWell(
          onTap: () {
          },
          child: Badge(
            label: Text(viewModel.numOfCartItem.toString()),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

class HeartIcon extends StatefulWidget {
  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: IconButton(onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });

        },
            icon:
            ImageIcon(
                AssetImage
                  (isPressed?
                'assets/heart filled.png'
                    :
                'assets/Vector.png'), size: 25.r,
                color:AppColors.primaryColor

            )
        )
    );
  }
}