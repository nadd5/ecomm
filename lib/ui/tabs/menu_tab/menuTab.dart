import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_theme.dart';
import '../../utils/appcolor.dart';
import '../cart_tab/cart_screen.dart';
import '../home_tab/home_screen_components/product_card.dart';
import 'Product Details/product_details_tab.dart';
import 'Product_ViewModel/product_ViewModel.dart';
import 'cubit/productStates.dart';

class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductViewModel viewModel = ProductViewModel();

    return BlocProvider(
      create: (context) => viewModel..getAllProduct(),
      child: BlocBuilder<ProductViewModel, ProductStates>(
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
                        Row(
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

                                Navigator.of(context)
                                    .pushNamed(CartScreen.routeName);
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
                        ),
                      ])),
              body: state is ProductSuccessState || state is AddCartSuccessState
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: viewModel.productList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.4,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(ProductDetailsTab
                              .routeName,
                              arguments: viewModel.productList![index]);
                        },

                        child: MenuProductCard(
                            product: viewModel.productList![index]));
                  },
                ),
              )
                  :
              Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor),));
        },
      ),
    );
  }
}

