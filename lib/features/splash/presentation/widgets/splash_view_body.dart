import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/features/splash/presentation/widgets/water_drop_animation.dart';
import 'dart:math' as math;

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin {
  late List<AnimationController> _dropControllers;
  late List<Animation<double>> _dropAnimations;
  late AnimationController _rippleController;
  late Animation<double> _rippleAnimation;
  late AnimationController _waveController;
  final int _numberOfDrops = 15; // Increased number of drops
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _executeNavigation();
  }

  void _initializeAnimations() {
    // Wave animation
    _waveController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // Ripple animation
    _rippleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rippleController,
      curve: Curves.easeInOut,
    ));

    _rippleController.repeat();

    // Water drop animations
    _dropControllers = List.generate(
      _numberOfDrops,
      (index) => AnimationController(
        duration: Duration(milliseconds: 2000 + _random.nextInt(2000)),
        vsync: this,
      ),
    );

    _dropAnimations = _dropControllers.map((controller) {
      return Tween<double>(
        begin: -100.0,
        end: 1.5.sh,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();

    for (var i = 0; i < _numberOfDrops; i++) {
      Future.delayed(Duration(milliseconds: _random.nextInt(2000)), () {
        _dropControllers[i].repeat();
      });
    }
  }

  @override
  void dispose() {
    _waveController.dispose();
    _rippleController.dispose();
    for (var controller in _dropControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF87CEEB), // Sky blue
            Color(0xFF1E90FF), // Dodger blue
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Animated Wave Background
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _waveController,
              builder: (context, child) {
                return CustomPaint(
                  painter: WavePainter(
                    animation: _waveController,
                    waveColor: Colors.white.withOpacity(0.1),
                  ),
                );
              },
            ),
          ),

          // Water Drops
          ..._buildWaterDrops(),

          // Center Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo with Ripple
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Multiple Ripples
                    ...List.generate(3, (index) {
                      return AnimatedBuilder(
                        animation: _rippleAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: 1 + (_rippleAnimation.value * 0.2 * (index + 1)),
                            child: Container(
                              width: 220.w,
                              height: 220.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.1 * (1 - _rippleAnimation.value)),
                              ),
                            ),
                          );
                        },
                      );
                    }),

                    // Logo Container
                    Container(
                      width: 180.w,
                      height: 180.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Image.asset(
                          'assets/images/app_icon.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),

                // App Name
                Text(
                  'صافيا المدينة',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8.h),

                // Tagline
                Text(
                  'مياه نقية بأفضل جودة',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white.withOpacity(0.9),
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(0, 1),
                        blurRadius: 2,
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

  List<Widget> _buildWaterDrops() {
    return List.generate(_numberOfDrops, (index) {
      return Positioned(
        left: _random.nextDouble() * 1.sw,
        child: WaterDrop(
          size: 10 + _random.nextDouble() * 10,
          animation: _dropAnimations[index],
        ),
      );
    });
  }

  void _executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      bool isOnBoardSeend = Shareds.getBool(isOnBoardSeen);
      bool isLogin = Shareds.getBool(isloged);
      bool isRegister = Shareds.getBool(isRegisterd);

      if (isOnBoardSeend) {
        if (isLogin || isRegister) {
          context.pushReplacementNamed(homeView);
        } else {
          context.pushReplacementNamed(login);
        }
      } else {
        context.pushReplacementNamed(onBoarding);
      }
    });
  }
}

// Wave Painter for animated background
class WavePainter extends CustomPainter {
  final Animation<double> animation;
  final Color waveColor;

  WavePainter({required this.animation, required this.waveColor});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final y = size.height * 0.8;
    
    path.moveTo(0, y);
    for (var i = 0.0; i < size.width; i++) {
      path.lineTo(
        i,
        y + math.sin((i / 30) + (animation.value * 2 * math.pi)) * 10,
      );
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final paint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;
}
//112
//lvlo


