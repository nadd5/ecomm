import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'appcolor.dart';

class AppTheme {
  static final ThemeData mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.whiteColor, backgroundColor: AppColors.primaryColor, // Button text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: const BorderSide(
          color: AppColors.whiteColor,
          width: 6,
        ),
      ),
    ),
  );
}
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 24.07.w),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColors.primaryColor)

      ),
      child: Row(
        children: [
          ImageIcon(AssetImage('assets/icon _search_.png'), color: AppColors.primaryColor,size: 24.sp,),
          SizedBox(width: 11.36.w,),
          Text('what do you search for?',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w200,color: AppColors.bgDarkColor),)
        ],
      ),
    );
  }
}
class Style
{
  static Image Logo = new Image(
      image: new ExactAssetImage("assets/r.png"));
  static var BottomNavigationBarTheme= BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      elevation: 0);
}
