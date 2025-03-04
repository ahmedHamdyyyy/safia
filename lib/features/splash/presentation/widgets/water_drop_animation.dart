import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';

class WaterDrop extends StatelessWidget {
  final double size;
  final Animation<double> animation;
  
  const WaterDrop({
    Key? key,
    required this.size,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: Container(
            width: size,
            height: size * 1.2,
            decoration: BoxDecoration(
              color: MyColors.blue500.withOpacity(0.3),
              borderRadius: BorderRadius.circular(size / 2),
            ),
          ),
        );
      },
    );
  }
} 