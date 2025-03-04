import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/custom_bloc_observer.dart';
import 'package:safiaa/core/helpers/injection_container.dart' as di;
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/routes_manger/routes_manager.dart';
import 'package:safiaa/generated/l10n.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:safiaa/features/products/domain/repositories/categories_rep.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Shareds.init();
  await di.init();
  Bloc.observer = CustomBlocObserver();
  runApp(const Safia());
}

class Safia extends StatelessWidget {
  const Safia({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if user is logged in as guest
    final isGuestUser = Shareds.getBool('isGuestUser');
    // Check if user has a valid auth token
    final hasToken = Shareds.getString(prefsKeyToken).isNotEmpty;

    return MultiBlocProvider(
      //ProfileCubit(di.sl<ProfileRepo>())..getProfile()
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthCubit>()..checkAuthStatus(),
        ),
        BlocProvider(
          create: (context) =>
              ProductsCubit(di.sl<CategoriesRep>())..fetchProducts(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            scaffoldBackgroundColor: MyColors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: MyColors.blue500),
            useMaterial3: true,
          ),
          onGenerateRoute: generateRoute,
          // If user has token, they're logged in properly, otherwise check guest status
          initialRoute: hasToken ? homeView : (isGuestUser ? homeView : splash),
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}
