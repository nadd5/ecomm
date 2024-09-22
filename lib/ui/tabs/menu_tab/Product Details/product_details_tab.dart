import 'package:ecomm/ui/tabs/Menu_tab/Product%20Details/product_tab_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../../../data/model/response/ProductResponse.dart';
import '../../../utils/appcolor.dart';

class ProductDetailsTab extends StatefulWidget {
  static const String routeName = 'productDetails_tab';

  const ProductDetailsTab({super.key});

  @override
  State<ProductDetailsTab> createState() => _ProductDetailsTabState();
}

class _ProductDetailsTabState extends State<ProductDetailsTab> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments! as Product;

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: Text('Product Details',
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: ProductTabImageSlider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                          args.title ?? '',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.pr,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'EGP${args.price}',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.pr,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  children: [
                    Container(
                      height: 34.h,
                      width: 102.w,
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border:
                        Border.all(color: AppColors.blackColor, width: 2),
                      ),
                      child: Text(
                        '${args.sold} Sold',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.pr,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      '(${args.ratingsAverage})',
                      style:
                      TextStyle(fontSize: 12.sp, color: AppColors.pr),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    StarIcon(),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      height: 42.h,
                      width: 122.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                        border:
                        Border.all(color: AppColors.blackColor, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {});
                                if (counter > 0) {
                                  counter--;
                                }
                              },
                              icon: Icon(
                                Icons.remove_circle_outline_rounded,
                                color: AppColors.whiteColor,
                                size: 20.sp,
                              )),
                          Text(
                            '$counter',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                              onPressed: () {
                                counter++;
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                color: AppColors.whiteColor,
                                size: 20.sp,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.pr,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ReadMoreText(
                  args.description ?? '',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.pr,
                      fontWeight: FontWeight.w400),
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: AppColors.primaryColor,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                ),
              ),
              SizedBox(
                height: 90.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total price',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          elevation: 0,
                        ),
                        child: Container(
                          height: 48.h,
                          width: 270.w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_shopping_cart_rounded,
                                size: 20.sp,
                                color: AppColors.whiteColor,
                              ),
                              Text(
                                'Add to cart',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  '${args.price! * counter}',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.pr,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
class StarIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){},
        icon: ImageIcon(AssetImage('assets/star.png'),color: Colors.amberAccent, ));
  }
}
