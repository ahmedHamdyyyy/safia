// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
// import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

// // ignore: must_be_immutable
// class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
//   SearchAppBar({super.key, this.title, this.fontSize, this.onPressed});

//   final String? title;
//   final double? fontSize;
//   void Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: MyColors.white,
//       centerTitle: true,
//       title: Text(
//         title ?? '',
//         style: getBoldStyle(color: MyColors.black, fontSize: 20.sp),
//       ),
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(right: 18.w),
//           child: SvgPicture.asset(
//             'assets/images/search-icon.svg',
//             width: 25.w,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
