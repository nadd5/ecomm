import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/ProductListView.dart';
import '../../../data/categorySection.dart';
import '../../home/home_screen.dart';
import '../../utils/app_theme.dart';
import '../../utils/appcolor.dart';
import 'cubit/home_tab_state.dart';
import 'cubit/home_tb_view_model.dart';
import 'home_screen_components/Image_slider.dart';
import 'home_screen_components/Image_sliderSmall.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar : AppBar( toolbarHeight:140.h,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          title:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Style.Logo,
                SizedBox(height: 18.h,),
                AppSearchBar(),
              ])),
      body: BlocBuilder<HomeTabViewModel, HomeTabState>(
        bloc: viewModel
          ..getAllCategories()
          ..getAllBrands(),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlider(),

                SizedBox(
                  height: 8.h,
                ),
                RowCustomName(name: 'Categories'),
                SizedBox(
                  height: 16.h,
                ),
                state is HomeTabCategoryLoadingState
                    ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                    : CategoryOrBrandSection(
                    list: viewModel.categoriesList ?? []),
                SizedBox(height: 8.h,),
                RowCustomName(name: 'Brands',),
                SizedBox(height: 16.h,),
                state is HomeTabBrandLoadingState ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,)) : CategoryOrBrandSection(
                    list: viewModel.brandsList ?? []),

                SizedBox(height: 8.h,),
                RowCustomName(name: 'Home Appliance'),
                ProductListView(),

                SizedBox(height: 10.h),
                ImageSlidersmall(),

                SizedBox(height: 16.h),
                RowCustomName(name: 'New Arrival'),
                ProductListView(),

                SizedBox(height: 16.h),
                RowCustomName(name: 'Smart Watch'),
                ProductListView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
class RowCustomName extends StatelessWidget {
  final String name;

  const RowCustomName({required this.name, super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name',
              style: Theme.of(context).textTheme.bodyMedium!
                  .copyWith(color: AppColors.primaryColor, fontSize: 18.sp)),
          TextButton(
              onPressed: () {},
              child: Text('View all',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
