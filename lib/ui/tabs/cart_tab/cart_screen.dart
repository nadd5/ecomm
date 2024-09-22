import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/appcolor.dart';
import 'Cubit/cart_screen_states.dart';
import 'Cubit/cart_screen_view_model.dart';
import 'cart_container.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = 'cart_Screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, CartStates>(
      bloc: CartScreenViewModel.get(context)..getCart(),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              title: Text('Cart',
                  style: TextStyle(
                      color: AppColors.pr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500)),
              centerTitle: true,
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryColor,
                  )),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage('assets/icon _search_.png'),
                      color: AppColors.primaryColor,
                      size: 24.sp,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.primaryColor,
                    )),
              ],
            ),
            body: state is GetCartSuccessState
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.response.data!.products!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return CartContainer(
                                productCart:
                                    state.response.data!.products![index],
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 98.h, left: 16.w, right: 16.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text('Total Price',
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    'EGP ${state.response.data!.totalCartPrice}',
                                    style: TextStyle(
                                        color: AppColors.pr,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    disabledBackgroundColor:
                                        AppColors.whiteColor,
                                    backgroundColor: AppColors.whiteColor),
                                child: Container(
                                  height: 48.h,
                                  width: 270.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Checkout',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.whiteColor,
                                        size: 18.sp,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ));
      },
    );
  }
}
