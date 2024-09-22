import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/response/ProductResponse.dart';
import '../../../utils/appcolor.dart';

class ProductTabImageSlider extends StatefulWidget {
  @override
  State<ProductTabImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ProductTabImageSlider> {
  List<AssetImage> imageInfo = [
    AssetImage('assets/announcement1.png'),
    AssetImage('assets/announcement2.png'),
    AssetImage('assets/announcement3.png')
  ];
  @override
  Widget build(BuildContext context) {
  var args = ModalRoute.of(context)?.settings.arguments! as Product;
  return Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.w),
  child: Container(
  height: 300.h,
  width: 398.w,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(15.r),
  border: Border.all(color: AppColors.primaryColor, width: 2)),
  child: AnotherCarousel(
  images: args.images!
      .map((url) => Image.network(
  url,
  fit: BoxFit.contain,
  height: 300.h,
  width: double.infinity,
  ))
      .toList(),
  dotSize: 5,
  indicatorBgPadding: 8.0,
  borderRadius: true,
  radius: Radius.circular(15.r),
  dotColor: AppColors.whiteColor,
  autoplayDuration: Duration(seconds: 30000),
  dotIncreasedColor: AppColors.primaryColor,
  animationCurve: Easing.linear,
  dotBgColor: Colors.transparent,
  ),
  ),
  );
  }
  }
