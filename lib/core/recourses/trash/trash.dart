// كونتينر الاب بار
// Container(
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
//                     "Let’s match your outfit".tr,
//                     style: getSemiBoldStyle(
//                         color: ColorManager.white, fontSize: AppSize.s26),
//                   ),
//                   const SizedBox(
//                     height: AppSize.s12,
//                   ),
//                   Text(
//                     "Your Attire is a Reflection of Your Attributes and Professionalism"
//                         .tr,
//                     textAlign: TextAlign.center,
//                     style: getRegularStyle(
//                         color: ColorManager.white, fontSize: AppSize.s16),
//                   )
//                 ],
//               ),
//             ),
//الكونتينر الي شايل  اتلالوان المقترحة
//  Container(
//                   padding: const EdgeInsets.all(PaddingSize.p20),
//                   width: double.infinity,
//                   height: 90,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: ColorManager.white),
//                     boxShadow: [
//                       BoxShadow(
//                           color: ColorManager.shadowColor,
//                           offset: const Offset(3.5, 3.5))
//                     ],
//                     borderRadius: BorderRadius.circular(AppSize.s20),
//                     color: context.theme.cardColor,
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Switch in colors".tr,
//                         style: getMediumStyle(
//                           color: context.theme.canvasColor,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 50,
//                       ),
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: AppSize.s14,
//                             backgroundColor: ColorManager.primary,
//                           ),
//                           const SizedBox(
//                             height: 2,
//                           ),
//                           Text(
//                             "blue",
//                             style: getMediumStyle(
//                                 color: context.theme.canvasColor,
//                                 fontSize: AppSize.s12),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         width: AppSize.s12,
//                       ),
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: AppSize.s14,
//                             backgroundColor: ColorManager.black,
//                           ),
//                           const SizedBox(
//                             height: 2,
//                           ),
//                           Text(
//                             "Black",
//                             style: getMediumStyle(
//                                 color: context.theme.canvasColor,
//                                 fontSize: AppSize.s12),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         width: AppSize.s12,
//                       ),
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: AppSize.s14,
//                             backgroundColor: ColorManager.gray,
//                           ),
//                           const SizedBox(
//                             height: 2,
//                           ),
//                           Text(
//                             "Gray",
//                             style: getMediumStyle(
//                                 color: context.theme.canvasColor,
//                                 fontSize: AppSize.s12),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
// bottomNavigationBar: DefaultBottomNavBar(
//   onTap: () {
//     setState(() {
//       selectedPage = index;
//     });
//   },
//   currentIndex: controller.currentIndex.value,
//   iconOfItem1: Icons.home_outlined,
//   iconOfItem2: LineIcons.tShirt,
//   iconOfItem3: Icons.person_outlined,
//   textOfItem1: "Home".tr,
//   textOfItem2: "My Clothes".tr,
//   textOfItem3: "Profile".tr,
// ),
