// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../core/recourses/color manager/color manager.dart';
// import '../../../../../core/recourses/styles manger/styles manager.dart';

// class MatchOutfitCard extends StatelessWidget {
//   MatchOutfitCard({
//     this.color,
//     required this.image,
//     required this.text,
//     required this.radius,
//   });
//   Color? color = Colors.white;
//   double radius = 16;
//   late String text;
//   late String image;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(color: ColorManager.gray, offset: const Offset(0, 2.5))
//         ],
//         color: context.theme.cardColor,
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(radius),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               image,
//               width: 80,
//               height: 80,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               text,
//               style: getSemiBoldStyle(color: context.theme.canvasColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
