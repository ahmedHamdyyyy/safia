import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/features/auth/presentation/pages/terms_and_conditon.dart';
import 'package:safiaa/features/profile/data/models/profile_model.dart';
import 'package:safiaa/features/profile/presentation/cubits/cubit/profile_cubit.dart';
import 'package:safiaa/features/profile/presentation/widgets/guest_profile_button.dart';

class ProfileViewBody extends StatelessWidget {
  final ProfileModel profileModel;
  final bool isGuest;

  const ProfileViewBody({
    super.key,
    required this.profileModel,
    this.isGuest = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isGuest) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.blue50,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColors.blue500, width: 2),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.person_outline, 
                  size: 50, 
                  color: Colors.black54
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'حساب زائر',
              style: getBoldStyle(
                color: MyColors.grayscale900,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 24),
            const GuestProfileButton(),
          ],
        ),
      );
    }

    // Regular profile UI
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColors.blue50,
            Colors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.all(20.h),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 120.w,
                        height: 120.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: MyColors.blue500, width: 3),
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/app_icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    profileModel.name.toString(),
                    style: getBoldStyle(
                      color: MyColors.black,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    profileModel.email.toString(),
                    style: getMediumStyle(
                      color: MyColors.grayscale600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    profileModel.phoneNumber.toString(),
                    style: getMediumStyle(
                      color: MyColors.blue500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            
            // Profile Options
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.only(top: 20.h),
                  children: [
                    ProfileButton(
                      icon: Icons.description,
                      title: 'الشروط والاحكام',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TermsAndCondition()),
                      ),
                    ),
                    ProfileButton(
                      icon: Icons.shopping_bag,
                      title: 'الطلبات الخاصة بي',
                      onTap: () => Navigator.pushNamed(context, allOrders),
                    ),

                    ProfileButton(
                      icon: Icons.logout,
                      title: 'تسجيل الخروج',
                      isDestructive: true,
                      onTap: () => _showLogoutDialog(context),
                    ),
                    ProfileButton(
                      icon: Icons.delete_forever,
                      title: 'حذف الحساب',
                      isDestructive: true,
                      onTap: () => _showDeleteAccountDialog(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'تأكيد تسجيل الخروج',
          style: getBoldStyle(color: MyColors.black, fontSize: 18.sp),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'هل أنت متأكد من تسجيل الخروج؟',
          style: getRegularStyle(color: MyColors.black, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: MyColors.blue500,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('إلغاء', style: getBoldStyle(fontSize: 16.sp)),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Shareds.clear();
                    Navigator.pushReplacementNamed(context, login);
                  },
                  child: Text('تسجيل الخروج', style: getBoldStyle(fontSize: 16.sp)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'تأكيد حذف الحساب',
          style: getBoldStyle(color: MyColors.black, fontSize: 18.sp),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'هل أنت متأكد من حذف الحساب؟\nلا يمكن التراجع عن هذا الإجراء.',
          style: getRegularStyle(color: MyColors.black, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: MyColors.blue500,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('إلغاء', style: getBoldStyle(fontSize: 16.sp)),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  onPressed: () {
                    context.read<ProfileCubit>().deleteAccount();
                    Shareds.clear();
                    Navigator.pushReplacementNamed(context, login);
                  },
                  child: Text('حذف الحساب', style: getBoldStyle(fontSize: 16.sp)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const ProfileButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: isDestructive ? Colors.red.withOpacity(0.1) : MyColors.blue50,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    icon,
                    color: isDestructive ? Colors.red : MyColors.blue500,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  title,
                  style: getMediumStyle(
                    color: isDestructive ? Colors.red : MyColors.black,
                    fontSize: 16.sp,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: isDestructive ? Colors.red : MyColors.blue500,
                  size: 18.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
