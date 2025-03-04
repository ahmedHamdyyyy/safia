// import '../fount%20manager/font%20manager.dart';
// import '../../../features/auth/presentation/view/screens/login.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../color manager/color manager.dart';
// import '../styles manger/styles manager.dart';
// import '../value manger/value manager.dart';
// import '../../utils/constants.dart';
// import '../../utils/custom navigation.dart';
// import 'onboarding controller.dart';

// class OnboardingView extends StatelessWidget {
//   const OnboardingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     OnboardingController controller = Get.put(OnboardingController());
//     return Obx(
//       () => Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       CustomNavigation.authNavigation(const LoginView());
//                     },
//                     child: const Text('Skip'),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 60, vertical: PaddingSize.p16),
//                   child: PageView(
//                     controller: controller.pageController,
//                     onPageChanged: (value) {
//                       controller.currentIndex.value = value;
//                     },
//                     physics: const BouncingScrollPhysics(),
//                     children: controller.images,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: MarginSize.m26),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: PaddingSize.p16,
//                 ),
//                 height: MediaQuery.of(context).size.height * 0.39,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(AppSize.s22),
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: AppSize.s8,
//                     ),
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Text(
//                             controller
//                                 .onBoardingText1[controller.currentIndex.value],
//                             style: getBoldStyle(
//                                 fontSize: AppSize.s26,
//                                 color: context.theme.primaryColor),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: AppSize.s24),
//                           Text(
//                             controller
//                                 .onBoardingText2[controller.currentIndex.value],
//                             style: getMediumStyle(
//                                 fontSize: FontSizeManager.s18,
//                                 color: context.theme.canvasColor),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SmoothPageIndicator(
//                           controller: controller.pageController,
//                           count: 2,
//                           effect: WormEffect(
//                             strokeWidth: 2,
//                             activeDotColor: ColorManager.primary,
//                             dotColor: ColorManager.gray,
//                             dotHeight: AppSize.s8,
//                             dotWidth: AppSize.s16,
//                           ),
//                         ),
//                         FloatingActionButton(
//                           onPressed: () {
//                             if (controller.currentIndex.value == 1) {
//                               CustomNavigation.authNavigation(
//                                   const LoginView());
//                             } else {
//                               controller.pageController.animateToPage(
//                                 (controller.pageController.page!.toInt() + 1),
//                                 duration: kTransitionDuration,
//                                 curve: Curves.fastLinearToSlowEaseIn,
//                               );
//                             }
//                           },
//                           child: Icon(controller.currentIndex.value == 2
//                               ? Icons.login
//                               : Icons.arrow_forward_ios),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: AppSize.s35),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
