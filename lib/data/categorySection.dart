import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categoryItem.dart';
import 'model/response/CategoryResponse.dart';

class CategoryOrBrandSection extends StatelessWidget {
  final List<CategoryOrBrand> list;

  const CategoryOrBrandSection({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(
              categoryOrBrand: list[index],
            );
          }),
    );
  }
}
