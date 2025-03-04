// import 'package:flutter/material.dart';
// import 'package:lo2ma_hanya/core/recourses/color_manager/color_manager.dart';
// import 'package:lo2ma_hanya/core/recourses/fount_manager/font_manager.dart';
// import 'package:lo2ma_hanya/core/recourses/styles_manger/styles_manager.dart';
// import 'package:lo2ma_hanya/core/recourses/value_manger/value_manager.dart';
// import 'package:svg_flutter/svg.dart';

// class CustomSearchBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         border: Border.all(color: MyColors.grayscale100),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: SvgPicture.asset(
//               'assets/images/search-icon.svg',
//             ),
//           ),
//           Expanded(
//             child: Text(
//               "What are you searching for",
//               style: getRegularStyle(
//                 color: MyColors.grayscale400,
//                 fontSize: 14,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: getSemiBoldStyle(
          color: MyColors.black,
          fontSize: 16.sp,
        ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsetsDirectional.only(
                start: 20, top: 10, bottom: 10, end: 20),
            hintText: 'Search for ...',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(11),
              child: SvgPicture.asset('assets/images/search-icon.svg'),
            ),
            hintStyle:
                getRegularStyle(color: MyColors.grayscale400, fontSize: 14.sp),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder()));
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
