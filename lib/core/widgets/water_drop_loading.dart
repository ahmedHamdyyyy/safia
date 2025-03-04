import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';

class WaterDropLoading extends StatefulWidget {
  const WaterDropLoading({super.key});

  @override
  State<WaterDropLoading> createState() => _WaterDropLoadingState();
}

class _WaterDropLoadingState extends State<WaterDropLoading>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late List<double> _horizontalOffsets;
  late List<double> _sizes;
  late List<double> _delays;
  final int _numberOfDrops = 15; // Increased number of drops

  @override
  void initState() {
    super.initState();
    
    final random = math.Random();
    
    // Initialize random positions, sizes and delays
    _horizontalOffsets = List.generate(_numberOfDrops, 
      (index) => random.nextDouble() * 300);
    _sizes = List.generate(_numberOfDrops, 
      (index) => 8.0 + random.nextDouble() * 8); // Random sizes between 8 and 16
    _delays = List.generate(_numberOfDrops, 
      (index) => random.nextDouble() * 2000); // Random delays up to 2 seconds

    _controllers = List.generate(
      _numberOfDrops,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1500 + random.nextInt(1000), // Random duration
        ),
      ),
    );

    _animations = _controllers.map((controller) {
      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween<double>(begin: -20, end: 800)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 100,
        ),
      ]).animate(controller);
    }).toList();

    // Start animations with random delays
    for (var i = 0; i < _numberOfDrops; i++) {
      Future.delayed(Duration(milliseconds: _delays[i].toInt()), () {
        if (mounted) {
          _controllers[i].repeat();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.05), // تقليل تعتيم الخلفية
      child: Stack(
        children: List.generate(_numberOfDrops, (index) {
          return Positioned(
            top: -20,
            left: _horizontalOffsets[index],
            child: AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                // زيادة الشفافية للقطرات
                final opacity = (0.6 - (_animations[index].value / 800)).clamp(0.0, 0.6);
                return Transform.translate(
                  offset: Offset(0, _animations[index].value),
                  child: CustomPaint(
                    size: Size(_sizes[index], _sizes[index] * 1.5),
                    painter: WaterDropPainter(
                      color: MyColors.blue500.withOpacity(opacity),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

class WaterDropPainter extends CustomPainter {
  final Color color;

  WaterDropPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..quadraticBezierTo(
        size.width,
        size.height * 0.5,
        size.width / 2,
        size.height,
      )
      ..quadraticBezierTo(
        0,
        size.height * 0.5,
        size.width / 2,
        0,
      )
      ..close();

    canvas.drawPath(path, paint);

    // زيادة شفافية تأثير اللمعان
    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.15) // تقليل تعتيم اللمعان
      ..style = PaintingStyle.fill;

    final shinePath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.2)
      ..quadraticBezierTo(
        size.width * 0.4,
        size.height * 0.3,
        size.width * 0.3,
        size.height * 0.4,
      )
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.3,
        size.width * 0.3,
        size.height * 0.2,
      )
      ..close();

    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(WaterDropPainter oldDelegate) => color != oldDelegate.color;
} 