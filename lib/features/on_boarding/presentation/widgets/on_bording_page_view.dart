import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/features/on_boarding/presentation/widgets/on_boarding_page_view_item.dart';

class OnBordingPageView extends StatelessWidget {
  const OnBordingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingPageViewIteam(
          height: 220.h,
          isVisible: true,
          background: 'assets/images/on_boarding_image1.svg',
          description:
              'احصل على مياه شرب نقية ومعبأة بعناية، تُوصل مباشرة\n إلى باب منزلك بضغطة زر واحدة، بكل سهولة وراحة.\n جودة لا تضاهى من قلب المدينة.',
          cricterImage: 'assets/images/on_boarding_image2.svg',
          title: 'صافيا المدينة - مياه نقية بأفضل جودة',
        ),
        OnBoardingPageViewIteam(
          height: 220.h,
          isVisible: false,
          background: 'assets/images/on_boarding_image2.svg',
          description:
              'لبِّ احتياجاتك اليومية من المناديل الورقية الفاخرة\n المصممة لتوفير النعومة والراحة، مع عروض مميزة\n وكميات وأسعار تنافسية.',
          cricterImage: 'assets/images/on_boarding_image3.svg',
          title: 'مناديل ورقية عالية الجودة',
        ),
        OnBoardingPageViewIteam(
          height: 220.h,
          isVisible: false,
          background: 'assets/images/on_boarding_image3.svg',
          description:
              'مع تطبيق صافيا - المدينة، ستستمتع بتجربة تسوق فريدة\n توفر لك الراحة والسهولة لتلبية جميع احتياجاتك من\n المياه المعدنية النقية والمناديل الورقية المعقمة.',
          cricterImage: 'assets/images/on_boarding_image1.svg',
          title: 'كل شيء في مكان واحد',
        ),
      ],
    );
  }
}
