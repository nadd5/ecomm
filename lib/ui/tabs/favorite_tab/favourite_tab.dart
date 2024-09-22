import 'package:ecomm/ui/tabs/favorite_tab/wishlistviewmodel/cubit/wishlist_states.dart';
import 'package:ecomm/ui/tabs/favorite_tab/wishlistviewmodel/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/home_screen.dart';
import '../../utils/app_theme.dart';
import '../../utils/appcolor.dart';
import 'favourite_container.dart';
class FavouriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListViewModel, WishlistStates>(
      bloc: WishListViewModel()..getWishlistItems(),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
                toolbarHeight: 140.h,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.whiteColor,
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Style.Logo,
                      SizedBox(
                        height: 18.h,
                      ),
                      AppSearchBar(),
                    ])),
            body: Column(
              children: [
                state is WishlistSuccuessState
                    ? Expanded(
                  child: ListView.builder(
                      itemCount: state.response.data!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return FavouriteContainer(
                          wishList: state.response.data![index],
                        );
                      }),
                )
                    : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ));
      },
    );
  }
}
