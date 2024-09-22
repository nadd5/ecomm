import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/response/ProductResponse.dart';
import '../../../utils/appcolor.dart';
import '../../../utils/heart_icon.dart';
import '../../Menu_tab/Product_ViewModel/product_ViewModel.dart';
import '../../favorite_tab/wishlistviewmodel/wishlist_view_model.dart';
import '../../menu_tab/Product Details/product_details_tab.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: 191.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.primaryColor, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset('assets/shoe.png', fit: BoxFit.cover,
                    width: 191.w,
                    height: 128.h),
              )
              , Positioned
                (top: 5.h,
                  right: 2.w,
                  child: HeartIcon()),

            ],

          ),

          SizedBox(height: 7.h,),

          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Product Name',
              style: TextStyle(fontSize: 14.sp, color: AppColors.pr),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,),
          )

          , SizedBox(height: 8.h,)
          , Padding(
            padding: EdgeInsets.only(left: 8.0.w),
            child: Text('EGP Price',
              style: TextStyle(fontSize: 14.sp, color: AppColors.pr),
              overflow: TextOverflow.ellipsis,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Row(

                children: [
                  Text('Review (0.0)',
                    style: TextStyle(fontSize: 12.sp, color: AppColors.pr),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  StarIcon(),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: Icon(Icons.add_circle, size: 32.sp,
                      color: AppColors.primaryColor,),
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}

class MenuProductCard extends StatefulWidget {
  final Product product;

  MenuProductCard({required this.product});

  @override
  State<MenuProductCard> createState() => _MenuProductCardState();
}

class _MenuProductCardState extends State<MenuProductCard> {
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: 191.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.primaryColor, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(widget.product.imageCover ?? '',
                      fit: BoxFit.cover, width: 191.w, height: 128.h),
                ),
              ),
              Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                          onPressed: () {
                            setState(() {});
                            isWishlist = !isWishlist;
                            WishListViewModel.get(context)
                                .addToWishlist((widget.product.id ?? '') as Product);
                          },
                          icon: ImageIcon(
                              AssetImage(isWishlist
                                  ? 'assets/heart filled.png'
                                  : 'assets/h.png'),
                              size: 25.r,
                              color: AppColors.primaryColor)))),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              widget.product.title ?? '',
              style: TextStyle(fontSize: 14.sp, color: AppColors.pr),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ), SizedBox(height: 8.h,)
          , Padding(
            padding: EdgeInsets.only(left: 8.0.w),
            child: Text('EGP ${widget.product.price}',
              style: TextStyle(fontSize: 14.sp, color: AppColors.pr),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    'Review (${widget.product.ratingsAverage})',
                    style: TextStyle(fontSize: 12.sp, color: AppColors.pr),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  StarIcon(),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      ProductViewModel.get(context).addToCart(
                          widget.product.id ?? '');
                    },
                    splashColor: Colors.transparent,
                    child: Icon(Icons.add_circle, size: 32.sp,
                      color: AppColors.primaryColor,),
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}
