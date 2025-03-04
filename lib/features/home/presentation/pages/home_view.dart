import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/cart/presentation/pages/cart_view.dart';
import 'package:safiaa/features/home/domain/repositories/panners_repo.dart';
import 'package:safiaa/features/home/presentation/cubits/cubit/panners_cubit.dart';
import 'package:safiaa/features/home/presentation/widgets/home_view_body.dart';
import 'package:safiaa/features/products/domain/repositories/categories_rep.dart';
import 'package:safiaa/features/products/presentation/cubit/categories/categories_cubit.dart';
import 'package:safiaa/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:safiaa/features/profile/presentation/pages/profile_view.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/home/presentation/widgets/guest_user_home_body.dart';
import 'package:safiaa/core/widgets/custom_bottom_nav_bar.dart';

import '../../../../core/recourses/routes_manger/const.dart';

class HomeView extends StatefulWidget {
  int index = 0;

  HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedPage = 0;

  List<Widget> widgetPage = [
    HomeViewBody(),
    CartView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    selectedPage = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthGuestSuccess) {
          // Show limited functionality for guest users
          return Scaffold(
            appBar: AppBar(
              title: const Text('Welcome Guest'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, login);
                  },
                ),
              ],
            ),
            body: const GuestUserHomeBody(),
          );
        } else if (state is AuthSuccess) {
          // Show full functionality for registered users
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PannersCubit(di.sl<PannerRepository>())..fetchBanners(),
              ),
              BlocProvider(
                create: (context) => CategoriesCubit(di.sl<CategoriesRep>())..fetchCategories(),
              ),
              BlocProvider(
                create: (context) => ProductsCubit(di.sl<CategoriesRep>())..fetchProducts(),
              ),
            ],
            child: Scaffold(
              body: SafeArea(
                child: widgetPage.elementAt(selectedPage),
              ),
              bottomNavigationBar: CustomBottomNavBar(
                currentIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
              ),
            ),
          );
        }
        
        // Show loading or initial state
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
