// import '../../../../../core/recourses/color%20manager/color%20manager.dart';
// import '../../../../../core/recourses/value%20manger/value%20manager.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DefaultBottomNavBar extends StatelessWidget {
//   DefaultBottomNavBar({
//     required this.onTap,
//     required this.currentIndex,
//     required this.iconOfItem1,
//     required this.iconOfItem2,
//     required this.iconOfItem3,
//     required this.textOfItem1,
//     required this.textOfItem2,
//     required this.textOfItem3,
//   });
//   Function(int?)? onTap;
//   late int currentIndex;
//   IconData? iconOfItem1;
//   IconData? iconOfItem2;
//   IconData? iconOfItem3;
//   String? textOfItem1;
//   String? textOfItem2;
//   String? textOfItem3;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: context.theme.scaffoldBackgroundColor,
//       currentIndex: currentIndex,
//       onTap: onTap,
//       iconSize: AppSize.s30,
//       unselectedItemColor: context.theme.canvasColor,
//       selectedFontSize: AppSize.s16,
//       selectedItemColor: context.theme.primaryColor,
//       type: BottomNavigationBarType.fixed,
//       elevation: AppSize.s26,
//       items: [
//         BottomNavigationBarItem(
//           label: textOfItem1,
//           icon: Icon(
//             iconOfItem1,
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: textOfItem2,
//           icon: Icon(
//             iconOfItem2,
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: textOfItem3,
//           icon: Icon(
//             iconOfItem3,
//           ),
//         )
//       ],
//     );
//   }
// }
