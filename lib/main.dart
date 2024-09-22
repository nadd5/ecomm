import 'dart:io';
import 'package:ecomm/ui/auth/login/login_screen.dart';
import 'package:ecomm/ui/auth/register/register_screen.dart';
import 'package:ecomm/ui/home/home_screen.dart';
import 'package:ecomm/ui/splash_screen.dart';
import 'package:ecomm/ui/tabs/Menu_tab/Product%20Details/product_details_tab.dart';
import 'package:ecomm/ui/tabs/Menu_tab/Product_ViewModel/product_ViewModel.dart';
import 'package:ecomm/ui/tabs/cart_tab/Cubit/cart_screen_view_model.dart';
import 'package:ecomm/ui/tabs/cart_tab/cart_screen.dart';
import 'package:ecomm/ui/tabs/favorite_tab/wishlistviewmodel/wishlist_view_model.dart';
import 'package:ecomm/ui/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_blocobserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  String route;
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreen.routeName;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductViewModel(),
        ),
        BlocProvider(
          create: (context) => CartScreenViewModel(),
        ),
        BlocProvider(
          create: (context) => WishListViewModel(),
        )
      ],
      child: Ecommerce(
        route: route,
      )));
}

class Ecommerce extends StatelessWidget {
  final String route;

  const Ecommerce({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child)
      {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            SplashScreen.routeName: (context) => SplashScreen(),
            ProductDetailsTab.routeName: (context) => ProductDetailsTab(),
            CartScreen.routeName: (context) => CartScreen(),
          },
        );

      },

    );
  }

}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}