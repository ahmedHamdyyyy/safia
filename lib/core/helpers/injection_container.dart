import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:safiaa/core/helpers/api_services.dart';
import 'package:safiaa/core/recourses/global_model.dart';
import 'package:safiaa/features/auth/data/repositories_impl/user_repo_impl.dart';
import 'package:safiaa/features/auth/data/repositrie/user_repos.dart';
import 'package:safiaa/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safiaa/features/cart/data/repositories_impl/cart_repo_impl.dart';
import 'package:safiaa/features/cart/domain/repositories/cart_repo.dart';
import 'package:safiaa/features/home/data/repositories_impl/panners_repo_impl.dart';
import 'package:safiaa/features/home/domain/repositories/panners_repo.dart';
import 'package:safiaa/features/home/presentation/cubits/cubit/panners_cubit.dart';
import 'package:safiaa/features/orders/data/repositories_impl/add_order_repo_impl.dart';
import 'package:safiaa/features/orders/data/repositories_impl/copouns_repo_impl.dart';
import 'package:safiaa/features/orders/domain/repositories/add_order_repo.dart';
import 'package:safiaa/features/orders/domain/repositories/copouns_repo.dart';
import 'package:safiaa/features/orders/presentation/cubit/add_order_cubit.dart';
import 'package:safiaa/features/products/data/repositories_impl/categories_repo_imp.dart';
import 'package:safiaa/features/products/domain/repositories/categories_rep.dart';
import 'package:safiaa/features/products/presentation/cubit/categories/categories_cubit.dart';
import 'package:safiaa/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:safiaa/features/profile/data/repositories_impl/profile_repo_impl.dart';
import 'package:safiaa/features/profile/domain/repositories/profile_repo.dart';
import 'package:safiaa/features/profile/presentation/cubits/cubit/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Auth Cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(userRepo: sl()));

  // Cache Helper
  // sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));

  // Shared Preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory<SharedPreferences>(() => sharedPreferences);

  // Dio Helper
  sl.registerLazySingleton<DioHelper>(() => DioHelper());

  // User Repo
  sl.registerLazySingleton<UserRepo>(() => UserRepoImpl(sl(), GlobalModel()));

  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Banner Repository
  sl.registerLazySingleton<PannerRepository>(() => PannerRepositoryImpl(sl()));

  // Banner Cubit
  sl.registerFactory<PannersCubit>(() => PannersCubit(sl()));

  //Category List Cubit
  sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(sl()));

  //Categories Repository
  sl.registerLazySingleton<CategoriesRep>(() => CategoriesRepoImp(sl()));

  //Products cubit
  sl.registerLazySingleton<ProductsCubit>(() => ProductsCubit(sl()));

  //Cart Cubit
  // sl.registerLazySingleton<CartCubit>(() => CartCubit(sl()));

  // //Cart Repository
  sl.registerLazySingleton<CartRepo>(() => CartRepoImpl(sl()));

  //Profile Cubit
  sl.registerLazySingleton<ProfileCubit>(() => ProfileCubit(sl()));

  //Profile Repository
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl()));

  //addOrder Cubit
  sl.registerLazySingleton<AddOrderCubit>(() => AddOrderCubit(sl()));

  //addOrder Repository
  sl.registerLazySingleton<AddOrderRepo>(() => AddOrderRepoImpl(sl()));

  //Coupon Cubit
  // sl.registerLazySingleton<CopounCubit>(() => CopounCubit(sl()));

  //Coupon Repository
  sl.registerLazySingleton<CopounsRepo>(() => CopounsRepoImpl(sl()));
}
