import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/helpers/shred.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnBoardingItem> _items = [
    OnBoardingItem(
      image: 'assets/images/on_boarding_image1.svg',
      title: 'صافيا المدينة - مياه نقية بأفضل جودة',
      description: 'احصل على مياه شرب نقية ومعبأة بعناية، تُوصل مباشرة\n إلى باب منزلك بضغطة زر واحدة، بكل سهولة وراحة.\n جودة لا تضاهى من قلب المدينة.',
      color: MyColors.blue500,
    ),
    OnBoardingItem(
      image: 'assets/images/on_boarding_image2.svg',
      title: 'مناديل ورقية عالية الجودة',
      description: 'لبِّ احتياجاتك اليومية من المناديل الورقية الفاخرة\n المصممة لتوفير النعومة والراحة، مع عروض مميزة\n وكميات وأسعار تنافسية.',
      color: MyColors.blue600,
    ),
    OnBoardingItem(
      image: 'assets/images/on_boarding_image3.svg',
      title: 'كل شيء في مكان واحد',
      description: 'مع تطبيق صافيا - المدينة، ستستمتع بتجربة تسوق فريدة\n توفر لك الراحة والسهولة لتلبية جميع احتياجاتك من\n المياه المعدنية النقية والمناديل الورقية المعقمة.',
      color: MyColors.blue700,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _items[_currentPage].color.withOpacity(0.1),
                  Colors.white,
                ],
              ),
            ),
          ),
          
          // Content
          SafeArea(
            child: Column(
              children: [
                // Skip button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: TextButton(
                      onPressed: () => _finishOnboarding(),
                      child: Text(
                        'تخطي',
                        style: TextStyle(
                          color: _items[_currentPage].color,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Page view
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _items.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      return _buildPage(_items[index]);
                    },
                  ),
                ),
                
                // Bottom navigation
                Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Page indicator
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _items.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          spacing: 4.w,
                          activeDotColor: _items[_currentPage].color,
                          dotColor: MyColors.grayscale300,
                        ),
                      ),
                      
                      // Next/Finish button
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _items.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _finishOnboarding();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _items[_currentPage].color,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _currentPage < _items.length - 1
                                    ? 'التالي'
                                    : 'ابدأ الآن',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                _currentPage < _items.length - 1
                                    ? Icons.arrow_forward
                                    : Icons.check,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnBoardingItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main Image with animation
          Hero(
            tag: item.image,
            child: Container(
              height: 300.h,
              child: SvgPicture.asset(
                item.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          
          // Title
          Text(
            item.title,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: item.color,
            ),
          ),
          SizedBox(height: 16.h),
          
          // Description
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: MyColors.grayscale600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  void _finishOnboarding() {
    Shareds.setBool(isOnBoardSeen, true);
    Navigator.pushReplacementNamed(context, login);
  }
}

class OnBoardingItem {
  final String image;
  final String title;
  final String description;
  final Color color;

  OnBoardingItem({
    required this.image,
    required this.title,
    required this.description,
    required this.color,
  });
}
