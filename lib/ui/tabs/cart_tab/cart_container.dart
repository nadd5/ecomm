import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/response/GetCartResponse.dart';
import '../../utils/appcolor.dart';
import 'Cubit/cart_screen_view_model.dart';

class CartContainer extends StatelessWidget {
  final GetProductCart productCart;

  CartContainer({required this.productCart});

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
                productCart.product?.imageCover ?? '',
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
                        productCart.product?.title ?? '',
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
                        'EGP ${productCart.price}',
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
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppColors.blackColor, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            int counter = productCart.count!.toInt();
                            counter--;
                            CartScreenViewModel.get(context).updateCountInCart(
                                productCart.product?.id ?? '', counter);
                          },
                          icon: Icon(
                            Icons.remove_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 20.sp,
                          )),
                      Text(
                        productCart.count.toString(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                          onPressed: () {
                            int counter = productCart.count!.toInt();
                            counter++;
                            CartScreenViewModel.get(context).updateCountInCart(
                                productCart.product?.id ?? '', counter);
                          },
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 20.sp,
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10.w,
                child: IconButton(
                    onPressed: () {
                      CartScreenViewModel.get(context)
                          .deleteItemFromCart(productCart.product?.id ?? '');
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColors.pr,
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
