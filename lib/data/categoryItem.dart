import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/utils/appcolor.dart';
import 'model/response/CategoryResponse.dart';
class CategoryOrBrandItem extends StatelessWidget {
  final CategoryOrBrand categoryOrBrand;

  const CategoryOrBrandItem({super.key, required this.categoryOrBrand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            //cachedNetworkImage

            child: CircleAvatar(
              backgroundImage: NetworkImage((categoryOrBrand.image ?? '')),
              radius: 50.r,
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 2,
            child: Text(
              categoryOrBrand.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ))
      ],
    );
  }
}
