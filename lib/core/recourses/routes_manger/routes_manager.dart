import 'package:flutter/material.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/features/auth/presentation/pages/forgot_pass_view.dart';
import 'package:safiaa/features/auth/presentation/pages/login_view.dart';
import 'package:safiaa/features/auth/presentation/pages/otp_view.dart';
import 'package:safiaa/features/auth/presentation/pages/sigup_view.dart';
import 'package:safiaa/features/auth/presentation/pages/terms_and_conditon.dart';
import 'package:safiaa/features/auth/presentation/widgets/change_password.dart';
import 'package:safiaa/features/auth/presentation/widgets/forgot_pass_otp.dart';
import 'package:safiaa/features/home/presentation/pages/home_view.dart';
import 'package:safiaa/features/on_boarding/presentation/pages/on_boarding_view.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/orders/presentation/pages/order_details_view.dart';
import 'package:safiaa/features/orders/presentation/widgets/add_order_view_body.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/presentation/pages/products_view.dart';
import 'package:safiaa/features/products/presentation/widgets/product_details.dart';
import 'package:safiaa/features/profile/presentation/pages/all_orders_view.dart';
import 'package:safiaa/features/profile/presentation/widgets/orders_detials.dart';
import 'package:safiaa/features/splash/presentation/pages/splash_view.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
      );
    case onBoarding:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingView(),
      );
    case login:
      return MaterialPageRoute(
        builder: (_) => LoginView(),
      );
    case singUp:
      return MaterialPageRoute(
        builder: (_) => const SigupView(),
      );

    case termAndCond:
      return MaterialPageRoute(
        builder: (_) => const TermsAndCondition(),
      );
    case homeView:
      return MaterialPageRoute(
        builder: (_) => HomeView(),
      );
    case productsView:
      return MaterialPageRoute(
        builder: (_) => const ProductsView(),
      );
    case otpView:
      return MaterialPageRoute(
        builder: (_) => const OTPView(),
      );
    case passwordReset:
      return MaterialPageRoute(
        builder: (_) => const ForgotPassView(),
      );
    case forgotPassOtp:
      return MaterialPageRoute(
        builder: (_) => const ForgotPassOtp(),
      );
    case changePassword:
      return MaterialPageRoute(
        builder: (_) => const ChangePassword(),
      );
    // add addorder view
    case addOrderView:
      return MaterialPageRoute(
        builder: (_) => const AddOrderViewBody(),
      );

    case orderDetailsView:
      return MaterialPageRoute(
        builder: (_) => OrderDetailsView(
          orderResponse: settings.arguments as OrderResponse,
        ),
      );

    case productsDetails:
      return MaterialPageRoute(
        builder: (_) => ProductDetails(
          products: settings.arguments as Products,
        ),
      );
    //all orders
    case allOrders:
      return MaterialPageRoute(
        builder: (_) => AllOrdersView(),
      );
    //orders view
    case ordersView:
      return MaterialPageRoute(
        builder: (_) => OrderDetails(
          order: settings.arguments as OrderResponse,
        ),
      );
  }
  return null;
}
