import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: 'الشروط والاحكام'),
              verticalSpace(16),
              Text(
                'مرحبًا بكم في تطبيق صافيا - المدينة. يُرجى قراءة الشروط والأحكام التالية بعناية قبل استخدام التطبيق: ',
                style: getSemiBoldStyle(color: MyColors.black, fontSize: 13.sp)
                    .copyWith(height: 1.8),
              ),
              const TermsAndConditonCustomText(
                title: 'إستخدام التطبيق:',
                description:
                    'يتم منحك حق الوصول إلى التطبيق واستخدامه فقط للأغراض الشخصية وغير التجارية. يجب عليك عدم استخدام التطبيق لأي غرض غير قانوني',
              ),
              const TermsAndConditonCustomText(
                title: 'إنشاء حساب:',
                description:
                    'عند إنشاء حساب، يجب أن تكون المعلومات التي تقدمها دقيقة وكاملة. أنت مسؤول عن الحفاظ على سرية معلومات حسابك',
              ),
              const TermsAndConditonCustomText(
                title: 'الطبات والدفع:',
                description:
                    'عند تقديم طلبك عبر التطبيق، ستظهر لك تفاصيل الطلب والمبلغ الإجمالي. يجب عليك التأكد من صحة المعلومات قبل إكمال عملية الدفع. نحن نستخدم طرق دفع آمنة لضمان حماية معلوماتك المالية.',
              ),
              const TermsAndConditonCustomText(
                title: 'إالغاءالطلبات:',
                description:
                    'يمكنك إلغاء الطلبات وفقًا للسياسات المحددة في التطبيق. يرجى مراجعة سياسة الإلغاء بعناية..',
              ),
              const TermsAndConditonCustomText(
                title: 'المسؤولبة:',
                description:
                    'نحن غير مسؤولين عن أي أضرار مباشرة أو غير مباشرة تنشأ عن استخدام التطبيق أو عدم القدرة على استخدامه',
              ),
              const TermsAndConditonCustomText(
                title: 'تعديلات الشروط والأحكام:',
                description:
                    'نحتفظ بالحق في تعديل هذه الشروط والأحكام في أي وقت. يجب على المستخدمين مراجعة هذه الصفحة بانتظام للبقاء على علم بأي تغييرات',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class TermsAndConditonCustomText extends StatelessWidget {
  const TermsAndConditonCustomText(
      {super.key, required this.title, required this.description});
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/SealCheck.svg',
              width: 20.w,
              height: 20.h,
            ),
            horizontalSpace(4),
            Text(
              title,
              style:
                  getSemiBoldStyle(color: MyColors.darkPrime, fontSize: 13.sp),
            ),
          ],
        ),
        verticalSpace(8),
        Text(
          description,
          style: getRegularStyle(color: MyColors.black, fontSize: 13.sp)
              .copyWith(height: 1.8),
        ),
      ],
    );
  }
}
