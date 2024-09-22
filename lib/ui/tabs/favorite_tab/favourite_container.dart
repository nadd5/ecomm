import 'package:ecomm/ui/tabs/favorite_tab/wishlistviewmodel/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/response/GetWishlistResponse.dart';
import '../../utils/appcolor.dart';

class FavouriteContainer extends StatelessWidget {
 final GetWishlistData wishList;
  FavouriteContainer({required this.wishList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      child: Container(
        height: 113.h,
        width: 398.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.blackColor, width: 1),
            borderRadius: BorderRadius.circular(15.r)),
        child: Container(
          height: 113.h,
          width: 120.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColors.blackColor, width: 1)),
          child: Stack(
            children: [
              Image.network(
                wishList.imageCover ?? '',
                alignment: Alignment.centerLeft,
              ),
              Positioned(
                left: 70.w,
                child: SizedBox(
                  width: 200.w,
                  height: 113.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wishList.title ?? '',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.pr),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'EGP ${wishList.price}',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.pr),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 12.h,
                right: 10.w,
                child: Container(
                    height: 42.h,
                    width: 122.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.blackColor, width: 2),
                    ),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor),
                      textAlign: TextAlign.center,
                    )),
              ),
              Positioned(
                right: 10.w,
                child: IconButton(
                    onPressed: () {
                      WishListViewModel.get(context)
                          .deleteItemFromWishlist(wishList.id ?? '');
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}