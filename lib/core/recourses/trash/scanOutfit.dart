// import '../../../../../core/recourses/images%20manager/images%20manager.dart';
// import 'add_photo_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../core/recourses/color manager/color manager.dart';
// import '../../../../../core/recourses/fount manager/font manager.dart';
// import '../../../../../core/recourses/styles manger/styles manager.dart';
// import '../../../../../core/recourses/value manger/value manager.dart';
// import '../../../../../core/widgets/default button.dart';

// class ScanOutfitView extends StatelessWidget {
//   const ScanOutfitView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: AppSize.s40,
//                   ),
//                   Text(
//                     "Scan Your Outfit".tr,
//                     style: getBoldStyle(
//                         color: context.theme.canvasColor,
//                         fontSize: FontSizeManager.s24),
//                   ),
//                   const SizedBox(
//                     height: AppSize.s30,
//                   ),
//                   SizedBox(
//                       height: 450,
//                       width: double.infinity,
//                       child: Image.asset(ImagesManager.scanYorOutfitImage)),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(PaddingSize.p20),
//               child: DefaultButton(
//                 text: "Done".tr,
//                 onPressed: () {
//                   Get.to(MatchOutfitView());
//                 },
//                 width: double.infinity,
//                 fontSize: FontSizeManager.s20,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
