// import '../../manger/profile_controller/profile_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../core/recourses/color manager/color manager.dart';
// import '../../../../../core/recourses/fount manager/font manager.dart';
// import '../../../../../core/recourses/styles manger/styles manager.dart';
// import '../../../../../core/recourses/value manger/value manager.dart';
// import '../../../../../core/widgets/default Text Form Field.dart';
// import '../../../../../core/widgets/default button.dart';
// import '../../../../auth/presentation/view/screens/widgets/Text manager.dart';

// class EditProfileView extends StatelessWidget {
//   const EditProfileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: ColorManager.primary,
//         ),
//         title: Text(
//           "Edit Profile".tr,
//           style: getBoldStyle(
//               color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
//               fontSize: FontSizeManager.s22),
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(PaddingSize.p20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: SizedBox(
//                   width: 110,
//                   height: 110,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Align(
//                         child: CircleAvatar(
//                           backgroundColor: ColorManager.gray,
//                           radius: 56,
//                         ),
//                       ),
//                       const CircleAvatar(
//                         radius: 50,
//                         backgroundColor: Colors.amber,
//                       ),
//                       Align(
//                           alignment: Alignment.bottomRight,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CircleAvatar(
//                               radius: FontSizeManager.s12,
//                               backgroundColor: Colors.orange,
//                               child: Icon(
//                                 Icons.add,
//                                 color: ColorManager.white,
//                               ),
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 60,
//               ),
//               CommonText(
//                 text: "Your Name".tr,
//               ),
//               const SizedBox(
//                 height: AppSize.s4,
//               ),
//               DefaultTextFormField(
//                 controller: cubit.yourNameController,
//                 type: TextInputType.text,
//                 hintText: "Your Name".tr,
//                 prefixIcon: Icons.person,
//               ),
//               const SizedBox(
//                 height: AppSize.s16,
//               ),
//               CommonText(
//                 text: "Email".tr,
//               ),
//               const SizedBox(
//                 height: AppSize.s4,
//               ),
//               DefaultTextFormField(
//                 controller: cubit.emailController,
//                 type: TextInputType.emailAddress,
//                 hintText: " Email".tr,
//                 prefixIcon: Icons.email_outlined,
//               ),
//               const SizedBox(
//                 height: AppSize.s16,
//               ),
//               CommonText(
//                 text: "Phone Number".tr,
//               ),
//               const SizedBox(
//                 height: AppSize.s4,
//               ),
//               DefaultTextFormField(
//                 controller: cubit.phoneController,
//                 type: TextInputType.phone,
//                 hintText: "Phone Number".tr,
//                 prefixIcon: Icons.phone,
//               ),
//               const SizedBox(
//                 height: 60,
//               ),
//               Align(
//                   alignment: Alignment.topLeft,
//                   child: DefaultButton(
//                     text: 'Save Change'.tr,
//                     fontSize: FontSizeManager.s18,
//                     width: 200,
//                     onPressed: () {
//                       Get.back();
//                     },
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
