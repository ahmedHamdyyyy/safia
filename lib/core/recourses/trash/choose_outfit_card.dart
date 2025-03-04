// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import '../../../../../core/recourses/color manager/color manager.dart';
// import '../../../../../core/recourses/styles manger/styles manager.dart';
// import '../../../../../core/recourses/value manger/value manager.dart';

// class ChooseOutfitCard extends StatelessWidget {
//   ChooseOutfitCard({this.cardText, this.icon, this.onTap});
//   String? cardText;
//   IconData? icon;
//   Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(PaddingSize.p8),
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: context.theme.shadowColor),
//               boxShadow: [
//                 BoxShadow(
//                     color: context.theme.shadowColor,
//                     offset: const Offset(0, 3))
//               ],
//               color: context.theme.cardColor,
//               borderRadius: BorderRadius.circular(AppSize.s16)),
//           padding: const EdgeInsets.all(PaddingSize.p4),
//           child: Row(
//             children: [
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     color: ColorManager.amber,
//                     borderRadius: BorderRadius.circular(AppSize.s16)),
//                 child: Icon(
//                   icon ?? CupertinoIcons.game_controller_solid,
//                   color: ColorManager.white,
//                 ),
//               ),
//               const SizedBox(
//                 width: AppSize.s20,
//               ),
//               Text(
//                 cardText ?? "",
//                 style: getMediumStyle(
//                     color: context.theme.canvasColor, fontSize: AppSize.s26),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
