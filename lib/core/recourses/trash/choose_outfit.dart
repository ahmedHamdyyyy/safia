// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../core/recourses/color manager/color manager.dart';
// import '../../../../../core/recourses/fount manager/font manager.dart';
// import '../../../../../core/recourses/styles manger/styles manager.dart';
// import '../../../../../core/recourses/value manger/value manager.dart';
// import '../../../../../core/widgets/default button.dart';
// import '../widget/choose_outfit_card.dart';

// class ChooseOutfitView extends StatelessWidget {
//   const ChooseOutfitView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: context.theme.splashColor,
//                 boxShadow: [
//                   BoxShadow(
//                       offset: const Offset(0, 5),
//                       color: context.theme.shadowColor)
//                 ],
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(AppSize.s40),
//                   bottomRight: Radius.circular(AppSize.s40),
//                 ),
//               ),
//               padding: const EdgeInsets.all(AppSize.s26),
//               width: double.infinity,
//               height: 200,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: Icon(
//                         Icons.arrow_back,
//                         color: ColorManager.white,
//                       )),
//                   Text(
//                     "Choose Outfit".tr,
//                     style: getSemiBoldStyle(
//                         color: ColorManager.white, fontSize: AppSize.s26),
//                   ),
//                   const SizedBox(
//                     height: AppSize.s20,
//                   ),
//                   Text(
//                     "Which outfit you want to match?".tr,
//                     style: getRegularStyle(
//                         color: ColorManager.white, fontSize: AppSize.s20),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: AppSize.s24,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: AppSize.s16),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: PaddingSize.p16),
//                     child: Text(
//                       "Which Category ?".tr,
//                       style: getBoldStyle(
//                           color: Get.isDarkMode
//                               ? ColorManager.darkBlue
//                               : ColorManager.white,
//                           fontSize: AppSize.s26),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ChooseOutfitCard(
//               cardText: "Shirt".tr,
//               onTap: () {},
//             ),
//             ChooseOutfitCard(cardText: "Pants".tr, onTap: () {}),
//             ChooseOutfitCard(cardText: "Jacket".tr, onTap: () {}),
//             ChooseOutfitCard(cardText: "Shorts".tr, onTap: () {}),
//             ChooseOutfitCard(cardText: "Shoes".tr, onTap: () {}),
//             const SizedBox(
//               height: AppSize.s40,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(PaddingSize.p20),
//               child: DefaultButton(
//                 text: "Start Scanning".tr,
//                 onPressed: () {
//                   Get.to(const ScanOutfitView());
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
