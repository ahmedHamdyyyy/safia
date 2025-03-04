// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../color manager/color manager.dart';
// import '../fount manager/font manager.dart';
// import '../styles manger/styles manager.dart';
// import '../value manger/value manager.dart';

// class ThemeService {
//   String key = 'isDarkTheme';
//   GetStorage box = GetStorage();
//   update(bool isDarkTheme) => box.write(key, isDarkTheme);
//   read() => box.read<bool>(key) ?? false;
//   ThemeMode get mode => read() ? ThemeMode.dark : ThemeMode.light;
//   switchTheme() {
//     Get.changeThemeMode(read() ? ThemeMode.light : ThemeMode.dark);
//     update(!read());
//   }
// }

// class Themes {
//   static ThemeData lightTheme = ThemeData(
//     // main colors
//     shadowColor: ColorManager.gray,
//     cardColor: ColorManager.cardColor,
//     canvasColor: ColorManager.black,
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     splashColor: ColorManager.primary,
//     scaffoldBackgroundColor: ColorManager.white,
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       iconTheme: IconThemeData(
//         color: ColorManager.black,
//         size: AppSize.s26,
//       ),
//       color: ColorManager.white,
//       shadowColor: ColorManager.shadowColor,
//       elevation: 0,
//       titleTextStyle: getRegularStyle(
//         color: Colors.white,
//         fontSize: FontSizeManager.s16,
//       ),
//     ),

//     buttonTheme: ButtonThemeData(
//       shape: const StadiumBorder(),
//       buttonColor: ColorManager.primary,
//       splashColor: ColorManager.lightPrimary,
//       textTheme: ButtonTextTheme.primary,
//     ),

//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding: const EdgeInsets.all(PaddingSize.p16),
//       hintStyle: getRegularStyle(
//         color: ColorManager.gray,
//         fontSize: FontSizeManager.s20,
//       ),
//       labelStyle: getRegularStyle(
//         color: ColorManager.gray,
//         fontSize: FontSizeManager.s20,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.darkGray,
//           width: 1.3,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.darkGray,
//           width: 1.3,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//       prefixIconColor: ColorManager.gray,
//       suffixIconColor: ColorManager.gray,
//     ),
//   );

//   static ThemeData darkTheme = ThemeData(
//     cardColor: ColorManager.darkPrimary,
//     canvasColor: ColorManager.white,
//     primaryColor: ColorManager.amber,
//     primaryColorLight: ColorManager.lightPrimary,
//     splashColor: ColorManager.darkPrimary,
//     // backgroundColor: ColorManager.lightPrimary,
//     shadowColor:Colors.black12,
//     scaffoldBackgroundColor: ColorManager.darkPrimary,
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       iconTheme: IconThemeData(
//         color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
//         size: AppSize.s26,
//       ),
//       color: ColorManager.darkPrimary,
//       shadowColor: ColorManager.shadowColor,
//       elevation: 0,
//       titleTextStyle: getRegularStyle(
//           color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
//           fontSize: FontSizeManager.s16),
//     ),
//     buttonTheme: ButtonThemeData(
//       shape: const StadiumBorder(),
//       buttonColor: ColorManager.amber,
//       splashColor: ColorManager.lightPrimary,
//       textTheme: ButtonTextTheme.primary,
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding: const EdgeInsets.all(PaddingSize.p16),
//       hintStyle: getRegularStyle(
//         color: ColorManager.gray,
//         fontSize: FontSizeManager.s20,
//       ),
//       labelStyle: getRegularStyle(
//         color: ColorManager.gray,
//         fontSize: FontSizeManager.s20,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.darkGray,
//           width: 1.3,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.darkGray,
//           width: 1.3,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//       prefixIconColor: ColorManager.gray,
//       suffixIconColor: ColorManager.gray,
//     ),
//   );
// }
